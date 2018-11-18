module Test.Weber.EventTarget where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Weber.EventTarget as EventTarget
import Weber.Window (window)

main :: Effect Unit
main = do
  _ <- EventTarget.addEventListener window "click" $ \_ -> log "CLICK"
  log $ "Click anywhere on the page and the message 'CLICK' should be logged."
  handler <- EventTarget.addEventListener window "dblclick" $ \_ -> log "DOUBLE CLICK"
  EventTarget.removeEventListener window "dblclick" handler
  log $ "Double click anywhere on the page and the message 'DOUBLE CLICK' should _not_ be logged."
  pure unit
