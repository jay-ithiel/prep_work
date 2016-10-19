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

  this.forEach(function(element) {
    accumulator = callback(accumulator, element);
  });

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

  let myComp = (a, b) => {
    if (a < b) {
      return -1;
    } else if (a === b) {
      return 0;
    } else {
      return 1;
    }
  };
  const comp = comparator || myComp;

  const pivot = this[0];
  let left = [];
  let right = [];

  for (let i = 1; i < this.length; i++) {
    let curr = this[i];
    if (comp(curr, pivot) < 0) {
      left.push(curr);
    } else {
      right.push(curr);
    }
  }

  let leftSorted = left.quickSort(comp);
  let rightSorted = right.quickSort(comp);

  return leftSorted.concat(pivot).concat(rightSorted);
}

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

function myFind(array, callback) {
  for (let i = 0; i < array.length; i++) {
    let curr = array[i];
    if (callback(curr)) { return curr }
  }
  return undefined;
}

myFind([1,2,3], (x) => x === 2);

// write sumNPrimes(n)
function isPrime(n) {
  if (n < 2) { return false }
  for (let div = 2; div < n; div++) {
    if (n % div == 0) { return false }
  }
  return true;
}

function sumNPrimes(n) {
  if (n < 1) return 0;
  let nPrimes = [];
  for (let num = 2; nPrimes.length < n; num++) {
    if (isPrime(num)) { nPrimes.push(num) }
  }
  return nPrimes.myReduce((a, b) => a + b )
}


// write Function.prototype.myBind.
Function.prototype.myBind = function(context, ...bindArgs) {
  return (...arguments) => {
    return this.apply(context, bindArgs.concat(arguments));
  };
}

// write Function.prototype.inherits.
Function.prototype.inherits = function(Parent) {
  function Surrogate() {};
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.constructor.prototype = this;
}
