exports.document = document;

exports["querySelector'"] = function(document) {
  return function(selector) {
    return function() {
      return document.querySelector(selector);
    };
  };
};
