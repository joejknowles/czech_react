
module.exports.add = function(propertyName, element) {
  var updatedArray = this.state[propertyName].concat([element]);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.concat = function(propertyName, element) {
  var updatedArray = this.state[propertyName].concat(element);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.shuffle = function(propertyName) {
  var shuffle = require('../extensions/arrayExtensions.js').safeShuffle;
  var shuffledArray = shuffle(this.state[propertyName]);
  this.setState(newObjectWithProperty(propertyName, shuffledArray));
}

module.exports.rotate = function(propertyName) {
  var rotate = require('../extensions/arrayExtensions.js').safeRotate;
  var rotatedArray = rotate(this.state[propertyName]);
  this.setState(newObjectWithProperty(propertyName, rotatedArray));
}

function newObjectWithProperty(propertyName, value) {
  return {[propertyName]: value};
}