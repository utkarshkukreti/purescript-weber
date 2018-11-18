exports.document = document;

exports["querySelector'"] = function(document) {
  return function(selector) {
    return function() {
      return document.querySelector(selector);
    };
  };
};

exports.querySelectorAll = function(document) {
  return function(selector) {
    return function() {
      return [].slice.call(document.querySelectorAll(selector));
    };
  };
};
