(() => {
  const capitalize = (string: string) =>
    string[0].toUpperCase() + string.slice(1);

  type Type = 'boolean' | 'number' | 'string' | 'effect0';

  type Event =
    | 'Animation'
    | 'Event'
    | 'Keyboard'
    | 'Mouse'
    | 'Pointer'
    | 'Touch'
    | 'Transition'
    | 'Ui'
    | 'Wheel';

  const All: Record<Event, Record<string, Type>> = {
    Animation: {
      animationName: 'string',
      elapsedTime: 'number',
      pseudoElement: 'string',
    },
    Event: {
      bubbles: 'boolean',
      cancelable: 'boolean',
      defaultPrevented: 'boolean',
      preventDefault: 'effect0',
      stopImmediatePropagation: 'effect0',
      stopPropagation: 'effect0',
      timeStamp: 'number',
      type: 'string',
    },
    Keyboard: {
      altKey: 'boolean',
      charCode: 'number',
      code: 'string',
      ctrlKey: 'boolean',
      key: 'string',
      keyCode: 'number',
      location: 'number',
      metaKey: 'boolean',
      repeat: 'boolean',
      shiftKey: 'boolean',
      which: 'number',
    },
    Mouse: {
      altKey: 'boolean',
      button: 'number',
      buttons: 'number',
      clientX: 'number',
      clientY: 'number',
      ctrlKey: 'boolean',
      layerX: 'number',
      layerY: 'number',
      metaKey: 'boolean',
      movementX: 'number',
      movementY: 'number',
      offsetX: 'number',
      offsetY: 'number',
      pageX: 'number',
      pageY: 'number',
      screenX: 'number',
      screenY: 'number',
      shiftKey: 'boolean',
      which: 'number',
      x: 'number',
      y: 'number',
    },
    Pointer: {
      height: 'number',
      isPrimary: 'boolean',
      pointerId: 'number',
      pointerType: 'string',
      pressure: 'number',
      tangentialPressure: 'number',
      tiltX: 'number',
      tiltY: 'number',
      twist: 'number',
      width: 'number',
    },
    Touch: {
      altKey: 'boolean',
      ctrlKey: 'boolean',
      metaKey: 'boolean',
      shiftKey: 'boolean',
    },
    Transition: {
      elapsedTime: 'number',
      propertyName: 'string',
      pseudoElement: 'string',
    },
    Ui: {
      detail: 'number',
    },
    Wheel: {
      deltaMode: 'number',
      deltaX: 'number',
      deltaY: 'number',
      deltaZ: 'number',
    },
  };

  const Extends: Record<Event, Event[]> = {
    Animation: ['Event'],
    Event: [],
    Keyboard: ['Ui', 'Event'],
    Mouse: ['Ui', 'Event'],
    Pointer: ['Mouse', 'Ui', 'Event'],
    Touch: ['Ui', 'Event'],
    Transition: ['Event'],
    Ui: ['Event'],
    Wheel: ['Mouse', 'Ui', 'Event'],
  };

  console.log(`module Weber.Event where

import Prelude

import Effect (Effect)

foreign import property :: forall a b c. a -> b -> c

foreign import effect0 :: forall a b. String -> a -> b`);

  const done: Record<string, Type> = {};
  for (const name of <Event[]>Object.keys(All)) {
    const value = All[name];
    console.log(`
--

foreign import data ${name} :: Type

class Is${name} a
`);
    for (const n in value) {
      const v = value[n];
      const identifier = n === 'type' ? "type'" : n;
      if (done[identifier]) {
        if (done[identifier] !== v) {
          console.error(identifier, done[identifier], v);
        }
        continue;
      }
      done[identifier] = v;
      switch (v) {
        case 'boolean':
        case 'number':
        case 'string':
          console.log(`${identifier} :: forall a. Is${name} a => a -> ${capitalize(
            v
          )}
${identifier} = property "${n}"
`);
          break;
        case 'effect0':
          console.log(`${identifier} :: forall a. Is${name} a => a -> Effect Unit
${identifier} = effect0 "${n}"
`);
      }
    }

    console.log(`instance is${name}${name} :: Is${name} ${name}`);
    for (const extend of Extends[name]) {
      console.log(`instance is${extend}${name} :: Is${extend} ${name}`);
    }
  }
})();
