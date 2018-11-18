module Test.Main where

import Prelude

import Effect (Effect)
import Test.Weber.Document as Document
import Test.Weber.Event as Event
import Test.Weber.EventTarget as EventTarget

main :: Effect Unit
main = do
  Event.main
  EventTarget.main
  Document.main
