module Weber.Event where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable

foreign import property :: forall a b c. a -> b -> c

foreign import effect0 :: forall a b. String -> a -> b

foreign import to :: forall a b. String -> a -> Nullable b

--

foreign import data Animation :: Type

class IsAnimation a

animationName :: forall a. IsAnimation a => a -> String
animationName = property "animationName"

elapsedTime :: forall a. IsAnimation a => a -> Number
elapsedTime = property "elapsedTime"

pseudoElement :: forall a. IsAnimation a => a -> String
pseudoElement = property "pseudoElement"

instance isAnimationAnimation :: IsAnimation Animation
instance isEventAnimation :: IsEvent Animation

toAnimation :: forall a. a -> Maybe Animation
toAnimation = Nullable.toMaybe <<< to "AnimationEvent"

--

foreign import data Clipboard :: Type

class IsClipboard a

instance isClipboardClipboard :: IsClipboard Clipboard
instance isEventClipboard :: IsEvent Clipboard

toClipboard :: forall a. a -> Maybe Clipboard
toClipboard = Nullable.toMaybe <<< to "ClipboardEvent"

--

foreign import data Composition :: Type

class IsComposition a

instance isCompositionComposition :: IsComposition Composition
instance isUiComposition :: IsUi Composition
instance isEventComposition :: IsEvent Composition

toComposition :: forall a. a -> Maybe Composition
toComposition = Nullable.toMaybe <<< to "CompositionEvent"

--

foreign import data Drag :: Type

class IsDrag a

instance isDragDrag :: IsDrag Drag
instance isMouseDrag :: IsMouse Drag
instance isUiDrag :: IsUi Drag
instance isEventDrag :: IsEvent Drag

toDrag :: forall a. a -> Maybe Drag
toDrag = Nullable.toMaybe <<< to "DragEvent"

--

foreign import data Event :: Type

class IsEvent a

bubbles :: forall a. IsEvent a => a -> Boolean
bubbles = property "bubbles"

cancelable :: forall a. IsEvent a => a -> Boolean
cancelable = property "cancelable"

defaultPrevented :: forall a. IsEvent a => a -> Boolean
defaultPrevented = property "defaultPrevented"

preventDefault :: forall a. IsEvent a => a -> Effect Unit
preventDefault = effect0 "preventDefault"

stopImmediatePropagation :: forall a. IsEvent a => a -> Effect Unit
stopImmediatePropagation = effect0 "stopImmediatePropagation"

stopPropagation :: forall a. IsEvent a => a -> Effect Unit
stopPropagation = effect0 "stopPropagation"

timeStamp :: forall a. IsEvent a => a -> Number
timeStamp = property "timeStamp"

type' :: forall a. IsEvent a => a -> String
type' = property "type"

instance isEventEvent :: IsEvent Event

toEvent :: forall a. a -> Maybe Event
toEvent = Nullable.toMaybe <<< to "Event"

--

foreign import data Focus :: Type

class IsFocus a

instance isFocusFocus :: IsFocus Focus
instance isUiFocus :: IsUi Focus
instance isEventFocus :: IsEvent Focus

toFocus :: forall a. a -> Maybe Focus
toFocus = Nullable.toMaybe <<< to "FocusEvent"

--

foreign import data Keyboard :: Type

class IsKeyboard a

altKey :: forall a. IsKeyboard a => a -> Boolean
altKey = property "altKey"

charCode :: forall a. IsKeyboard a => a -> Number
charCode = property "charCode"

code :: forall a. IsKeyboard a => a -> String
code = property "code"

ctrlKey :: forall a. IsKeyboard a => a -> Boolean
ctrlKey = property "ctrlKey"

key :: forall a. IsKeyboard a => a -> String
key = property "key"

keyCode :: forall a. IsKeyboard a => a -> Number
keyCode = property "keyCode"

location :: forall a. IsKeyboard a => a -> Number
location = property "location"

metaKey :: forall a. IsKeyboard a => a -> Boolean
metaKey = property "metaKey"

repeat :: forall a. IsKeyboard a => a -> Boolean
repeat = property "repeat"

shiftKey :: forall a. IsKeyboard a => a -> Boolean
shiftKey = property "shiftKey"

which :: forall a. IsKeyboard a => a -> Number
which = property "which"

instance isKeyboardKeyboard :: IsKeyboard Keyboard
instance isUiKeyboard :: IsUi Keyboard
instance isEventKeyboard :: IsEvent Keyboard

toKeyboard :: forall a. a -> Maybe Keyboard
toKeyboard = Nullable.toMaybe <<< to "KeyboardEvent"

--

foreign import data Mouse :: Type

class IsMouse a

button :: forall a. IsMouse a => a -> Number
button = property "button"

buttons :: forall a. IsMouse a => a -> Number
buttons = property "buttons"

clientX :: forall a. IsMouse a => a -> Number
clientX = property "clientX"

clientY :: forall a. IsMouse a => a -> Number
clientY = property "clientY"

layerX :: forall a. IsMouse a => a -> Number
layerX = property "layerX"

layerY :: forall a. IsMouse a => a -> Number
layerY = property "layerY"

movementX :: forall a. IsMouse a => a -> Number
movementX = property "movementX"

movementY :: forall a. IsMouse a => a -> Number
movementY = property "movementY"

offsetX :: forall a. IsMouse a => a -> Number
offsetX = property "offsetX"

offsetY :: forall a. IsMouse a => a -> Number
offsetY = property "offsetY"

pageX :: forall a. IsMouse a => a -> Number
pageX = property "pageX"

pageY :: forall a. IsMouse a => a -> Number
pageY = property "pageY"

screenX :: forall a. IsMouse a => a -> Number
screenX = property "screenX"

screenY :: forall a. IsMouse a => a -> Number
screenY = property "screenY"

x :: forall a. IsMouse a => a -> Number
x = property "x"

y :: forall a. IsMouse a => a -> Number
y = property "y"

instance isMouseMouse :: IsMouse Mouse
instance isUiMouse :: IsUi Mouse
instance isEventMouse :: IsEvent Mouse

toMouse :: forall a. a -> Maybe Mouse
toMouse = Nullable.toMaybe <<< to "MouseEvent"

--

foreign import data Pointer :: Type

class IsPointer a

height :: forall a. IsPointer a => a -> Number
height = property "height"

isPrimary :: forall a. IsPointer a => a -> Boolean
isPrimary = property "isPrimary"

pointerId :: forall a. IsPointer a => a -> Number
pointerId = property "pointerId"

pointerType :: forall a. IsPointer a => a -> String
pointerType = property "pointerType"

pressure :: forall a. IsPointer a => a -> Number
pressure = property "pressure"

tangentialPressure :: forall a. IsPointer a => a -> Number
tangentialPressure = property "tangentialPressure"

tiltX :: forall a. IsPointer a => a -> Number
tiltX = property "tiltX"

tiltY :: forall a. IsPointer a => a -> Number
tiltY = property "tiltY"

twist :: forall a. IsPointer a => a -> Number
twist = property "twist"

width :: forall a. IsPointer a => a -> Number
width = property "width"

instance isPointerPointer :: IsPointer Pointer
instance isMousePointer :: IsMouse Pointer
instance isUiPointer :: IsUi Pointer
instance isEventPointer :: IsEvent Pointer

toPointer :: forall a. a -> Maybe Pointer
toPointer = Nullable.toMaybe <<< to "PointerEvent"

--

foreign import data Touch :: Type

class IsTouch a

instance isTouchTouch :: IsTouch Touch
instance isUiTouch :: IsUi Touch
instance isEventTouch :: IsEvent Touch

toTouch :: forall a. a -> Maybe Touch
toTouch = Nullable.toMaybe <<< to "TouchEvent"

--

foreign import data Transition :: Type

class IsTransition a

propertyName :: forall a. IsTransition a => a -> String
propertyName = property "propertyName"

instance isTransitionTransition :: IsTransition Transition
instance isEventTransition :: IsEvent Transition

toTransition :: forall a. a -> Maybe Transition
toTransition = Nullable.toMaybe <<< to "TransitionEvent"

--

foreign import data Ui :: Type

class IsUi a

detail :: forall a. IsUi a => a -> Number
detail = property "detail"

instance isUiUi :: IsUi Ui
instance isEventUi :: IsEvent Ui

toUi :: forall a. a -> Maybe Ui
toUi = Nullable.toMaybe <<< to "UIEvent"

--

foreign import data Wheel :: Type

class IsWheel a

deltaMode :: forall a. IsWheel a => a -> Number
deltaMode = property "deltaMode"

deltaX :: forall a. IsWheel a => a -> Number
deltaX = property "deltaX"

deltaY :: forall a. IsWheel a => a -> Number
deltaY = property "deltaY"

deltaZ :: forall a. IsWheel a => a -> Number
deltaZ = property "deltaZ"

instance isWheelWheel :: IsWheel Wheel
instance isMouseWheel :: IsMouse Wheel
instance isUiWheel :: IsUi Wheel
instance isEventWheel :: IsEvent Wheel

toWheel :: forall a. a -> Maybe Wheel
toWheel = Nullable.toMaybe <<< to "WheelEvent"
