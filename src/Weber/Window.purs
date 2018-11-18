module Weber.Window where

import Weber.EventTarget (class IsEventTarget)

foreign import data Window :: Type

foreign import window :: Window

instance isEventTargetWindow :: IsEventTarget Window
