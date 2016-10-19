// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function(startIdx, endIdx) {
  if (endIdx == null || endIdx > this.length) { endIdx = this.length }
  let sliced = "";

  for (let i = startIdx; i < endIdx; i++) {
    sliced += this[i];
  }

  return sliced;
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function(callback, accumulator) {
  if (accumulator == null) { accumulator = this.shift(); }
  for (let i = 0; i < this.length; i++) {
    accumulator = callback(accumulator, this[i]);
  }
  return accumulator;
}


// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function(comparator) {
  if (this.length <= 1) { return this }

  if (comparator == null) { comparator = (x, y) => {
    if (x === y) {
      return 0;
    } else if (x < y) {
      return -1;
    } else {
      return 1;
    }
  }}

  let pivot = this[0];
  let left = [];
  let right = [];

  for (let i = 1; i < this.length; i++) {
    let curr = this[i];
    if (comparator(pivot, curr) < 0) {
      right.push(curr);
    } else {
      left.push(curr);
    }
  }

  let leftSorted = left.quickSort();
  let rightSorted = right.quickSort();

  return leftSorted.concat(pivot).concat(rightSorted);
}


// write myFind(array, callback). It should return the first element for
// which callback returns true, or undefined if none is found.
function myFind(array, callback) {
  for (let i = 0; i < array.length; i++) {
    if (callback(array[i])) { return array[i] }
  }
  return undefined;
}

// write sumNPrimes(n)
function isPrime(n) {
  if (n < 2) { return false }
  for (let div = 2; div < n; div++) {
    if (n % div == 0) { return false }
  }
  return true;
}


function sumNPrimes(n) {
  if (n === 0) { return 0 }
  let nPrimes = [];

  for (let num = 2; nPrimes.length < n; num++) {
    if (isPrime(num)) { nPrimes.push(num) }
  }

  return nPrimes.myReduce((a,b) => a + b );
}



// write Function.prototype.myBind.
Function.prototype.myBind = function(context, arg) {
  let args = Array.from(arguments);
  alert(arg.name);
  if (args.length > 1) {
    return () => { return this.apply(context, args.splice(1)) }
  } else {
    return () => { return this.apply(context)}
  }
}


// write Function.prototype.inherits.
Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}
