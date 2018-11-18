module Test.Weber.Event where

import Prelude

import Data.Maybe (isJust, isNothing)
import Effect (Effect)
import Effect.Console (log)
import Weber.Event as Event

foreign import e0 :: Event.Animation
foreign import e1 :: Event.Event
foreign import e2 :: Event.Keyboard
foreign import e3 :: Event.Event

main :: Effect Unit
main = do
  log $ show $ Event.animationName e0 == "e0"
  log $ show $ Event.bubbles e0 == false
  log $ show $ Event.type' e0 == "e0"
  -- Shouldn't compile:
  -- log $ show $ Event.animationName e1 == "e0"
  -- Shouldn't compile:
  -- log $ show $ Event.altKey e1 == true
  log $ show $ Event.bubbles e1 == true
  Event.preventDefault e1
  Event.stopPropagation e1
  log $ show $ Event.altKey e2 == true
  -- Shouldn't compile:
  -- log $ show $ Event.animationName e2 == "e2"
  log $ show $ isJust $ Event.toMouse e3
  log $ show $ isNothing $ Event.toKeyboard e3
  log $ show $ show (Event.bubbles <$> Event.toMouse e3) == "(Just true)"
  log $ show $ show (Event.type' <$> Event.toMouse e3) == "(Just \"click\")"
