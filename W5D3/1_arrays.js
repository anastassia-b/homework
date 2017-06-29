//1. Fundamentals
//Monkey Patching Array class

Array.prototype.uniq = function() {
  let uniqueArray = [];

  this.forEach(function (el) {
    if (!uniqueArray.includes(el)) {
      uniqueArray.push(el);
    }
  });
  return uniqueArray;
};


//Time complexity is N^2, but we can reduce it to N by using a hash.
Array.prototype.twoSum2 = function() {
  const pairs = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = (i+1); j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
};

Array.prototype.transpose = function() {
  let transpose_arr = [];

  for (let i = 0; i < this.length; i++) {
    let row = [];
    for (let j = 0; j < this.length; j++) {
      row.push(this[j][i]);
    }
    transpose_arr.push(row);
  }

  return transpose_arr;
};

console.log([1, 2, 3], [4, 5, 6], [7, 8, 9]);
