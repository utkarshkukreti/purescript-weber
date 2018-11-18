module Test.Weber.Document where

import Prelude

import Data.Maybe (isJust, isNothing)
import Effect (Effect)
import Effect.Console (log)
import Weber.Document as Document

main :: Effect Unit
main = do
  el <- Document.querySelector Document.document "body"
  log $ show $ isJust el
  el' <- Document.querySelector Document.document "foo"
  log $ show $ isNothing el'

  els <- Document.querySelectorAll Document.document "body"
  log $ show $ case els of
    [_] -> true
    _ -> false

  els' <- Document.querySelectorAll Document.document "main"
  log $ show $ case els' of
    [] -> true
    _ -> false
