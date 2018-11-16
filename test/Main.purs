module Test.Main where

import Prelude
import Effect (Effect)
import Test.Weber.Event as Event

main :: Effect Unit
main = do
  Event.main
