module Weber.EventTarget where

import Prelude

import Effect (Effect)
import Weber.Event (Event)

class IsEventTarget a

foreign import data Handler :: Type

foreign import addEventListener :: forall a. IsEventTarget a => a -> String -> (Event -> Effect Unit) -> Effect Handler

foreign import removeEventListener :: forall a. IsEventTarget a => a -> String -> Handler -> Effect Unit
