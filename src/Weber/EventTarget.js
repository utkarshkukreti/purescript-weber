exports.addEventListener = function(_dict) {
  return function(eventTarget) {
    return function(type) {
      return function(handler) {
        return function() {
          const f = function(event) {
            handler(event)();
          };
          eventTarget.addEventListener(type, f);
          return f;
        };
      };
    };
  };
};

exports.removeEventListener = function(_dict) {
  return function(eventTarget) {
    return function(type) {
      return function(f) {
        return function() {
          eventTarget.removeEventListener(type, f);
        };
      };
    };
  };
};
