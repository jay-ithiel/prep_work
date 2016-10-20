// Write a function, `shuffledSentenceDetector(sentence1, sentence2)`, that
// returns true if the words in `sentence1` can be rearranged to form
// `sentence2`.
function shuffledSentenceDetector(sentence1, sentence2) {
  let a1 = sentence1.split(' ');
  let a2 = sentence2.split(' ');
  let matcher = [];

  for (let i = 0; i < a1.length; i++) {
    if (a1.includes(a2[i])) {
      matcher.push(a2[i]);
    }
  }

  if (a2.join(' ') == matcher.join(' ')) {
    if (a1.length === matcher.length) { return true; }
    else { return false; }
  } else {
    return false;
  }
}

// Write an Array function, myEach(callback), that passes each element to
// `callback` before returning the original array. Do NOT call the built-in
// Array#forEach method in your implementation.
Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  return this;
}

// Write a an Array method, myMap, that takes a callback and returns a new array
// containing the result of the callback for each element in the array. Use the
// Array#myEach method you defined above. Do NOT call the built-in Array#forEach
// or Array#map methods in your implementation.
Array.prototype.myMap = function(callback) {
  let mapped = [];

  this.myEach(function(el) {
    mapped.push(callback(el));
  });

  return mapped;
}


// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
function pairMatch(array, callback) {
  let res = [];

  for (let i = 0; i < array.length; i++) {
    for (let j = 0; j < array.length; j++) {
      if (i === j) { continue }
      if (callback(array[i], array[j])) {
        res.push([i, j]);
      }
    }
  }

  return res;
}

// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }

// Write an Array method, bubbleSort(callback), that bubble sorts an array.
// It should take an optional callback that compares two elements, returning
// -1 if the first element should appear before the second, 0 if they are
// equal, and 1 if the first element should appear after the second. Do NOT call
// the built-in Array#sort method in your implementation. Also, do NOT
// modify the original array.
//
// Here's a quick summary of the bubble sort algorithm:
//
// Iterate over the elements of the array. If the current element is unsorted
// with respect to the next element, swap them. If any swaps are made before
// reaching the end of the array, repeat the process. Otherwise, return the
// sorted array.
Array.prototype.bubbleSort = function(callback) {
  let dup = [];
  for (let i = 0; i < this.length; i++) {
    dup.push(this[i]);
  }
  

  if (typeof(callback) != 'function') {
    callback = (a, b) => {
      if (a < b) { return -1 }
      else if (a === b) { return 0 }
      else { return 1 }
    }
  }

  let sorted = false;
  while (!sorted) {
    sorted = true;

    for (let i = 0; i < dup.length-1; i++) {
      let el1 = dup[i];
      let el2 = dup[i+1];

      if (callback(el1, el2) > 0) {
        sorted = false;
        dup[i] = el2;
        dup[i+1] = el1;
      }
    }
  }

  return dup;
}

// write a Function method, myBind(context). It should return a copy of the
// original function, where `this` is set to `context`.
Function.prototype.myBind = function(context, ...bindArgs) {
  return (...arguments) => {
    return this.apply(context, bindArgs.concat(arguments));
  }
}

// write a method, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`.
function inherits(Child, Parent) {
  function Surrogate() {};
  Surrogate.prototype = Parent.prototype;
  Child.prototype = new Surrogate();
  Child.prototype.constructor = Child;
}

// write a method, `myCurry(fn, object, numArgs)`, that curries the
// function. Remember that a curried function is invoked with one argument at a
// time. For example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, object, numArgs) {
  let args = [];

  function _curry(n) {
    args.push(n);
    if (args.length >= numArgs) {
      return fn.apply(object, args);
    } else {
      return _curry;
    }
  }

  return _curry;
}
