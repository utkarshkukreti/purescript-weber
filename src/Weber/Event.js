exports.property = function(a) {
  return function(b) {
    return b[a];
  };
};

exports.effect0 = function(a) {
  return function(b) {
    return function() {
      return b[a]();
    };
  };
};

exports.to = function(name) {
  return function(a) {
    return a instanceof window[name] ? a : null;
  };
};
