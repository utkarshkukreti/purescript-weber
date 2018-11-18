module Weber.Document where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable
import Effect (Effect)
import Weber.Element (Element)

foreign import data Document :: Type

foreign import document :: Document

foreign import querySelector' :: Document -> String -> Effect (Nullable Element)

querySelector :: Document -> String -> Effect (Maybe Element)
querySelector document' selector = Nullable.toMaybe <$> querySelector' document' selector
