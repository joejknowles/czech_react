
module.exports.add = function(propertyName, element) {
  var updatedArray = this.state[propertyName].concat([element]);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.concat = function(propertyName, element) {
  var updatedArray = this.state[propertyName].concat(element);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.shuffle = function(propertyName) {
  var shuffle = require('../extensions/arrayExtensions.js').shuffleArray;
  var shuffledArray = shuffle(this.state[propertyName])
  this.setState(newObjectWithProperty(propertyName, shuffledArray));
}

function newObjectWithProperty(propertyName, value) {
  return {[propertyName]: value};
}