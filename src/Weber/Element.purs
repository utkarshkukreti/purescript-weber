module Weber.Element where

import Weber.EventTarget (class IsEventTarget)

foreign import data Element :: Type

instance isEventTargetElement :: IsEventTarget Element
