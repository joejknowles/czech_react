module.exports.safeShuffle = function(a) {
  a = a.slice();
  return shuffle(a);
};

module.exports.dangerousShuffle = function(a) {
  return shuffle(a);
};

function shuffle(a) {
  var j, x, i;
  for (i = a.length; i; i -= 1) {
      j = Math.floor(Math.random() * i);
      x = a[i - 1];
      a[i - 1] = a[j];
      a[j] = x;
  }
  return a;
}

module.exports.safeRotate = function(a) {
  a = a.slice();
  var firstElement = a.shift();
  return a.concat([firstElement]);
};