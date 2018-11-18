exports.e0 = {
  animationName: 'e0',
  bubbles: false,
  type: 'e0',
};

exports.e1 = {
  bubbles: true,
  preventDefault: function() {
    // console.log('preventDefault!');
  },
  stopPropagation: function() {
    // console.log('stopPropagation!');
  },
};

exports.e2 = {
  altKey: true,
};

// Polyfill because Node doesn't have these things.
function MouseEvent(name, properties) {
  this.type = name;
  Object.assign(this, properties);
}
function KeyboardEvent() {}
global.window = { MouseEvent: MouseEvent, KeyboardEvent: KeyboardEvent };

exports.e3 = new MouseEvent('click', { bubbles: true });
