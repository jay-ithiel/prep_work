// sum
//
// Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, then rewrite your solution to use the ... rest operator.

function sumArgs() {
  let arr = Array.from(arguments);
  let sum = 0;
  arr.forEach((n) => {
    sum += n;
  });
  return sum;
}

function sum(...args) {
  let sum = 0;

  args.forEach((n) => {
    sum += n;
  });

  return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


// bind with args
//
// Rewrite your myBind method so that it can take both bind-time arguments and call-time arguments.

// Solve it first using the arguments keyword.
//
// Within your myBind method, you'll have to define a new, anonymous function to be returned. Be careful: using arguments inside the anonymous function will not give you the arguments passed to myBind, because arguments is reset on every function invocation (just like this).
//
// That makes sense, because there are two arrays of arguments you care about: the extra arguments passed to myBind, and the arguments passed when the bound function is called.
//
// Once you've done that, write a second version using the ... rest operator.

Function.prototype.myBind1 = function(context) {
  let args = Array.from(arguments);
  args.shift();
  let self = this;

  return function() {
    args = args.concat(Array.from(arguments));
    return self.apply(context, args);
  }
}

Function.prototype.myBind = function(context, ...bindArgs) {
  return (...arguments) => {
    return this.apply(context, bindArgs.concat(arguments));
  }
}
//
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// console.log(markov.says("meow", "Ned")) === "Markov says meow to Ned!";
//
//
// console.log(markov.says.myBind(breakfast, "meow", "Kush")()) === "Breakfast says meow to Kush!";
//
//
// console.log(markov.says.myBind(breakfast)("meow", "a tree")) === "Breakfast says meow to a tree!";
//
//
// console.log(markov.says.myBind(breakfast, "meow")("Markov")) === "Breakfast says meow to Markov!";
//
//
// const notMarkovSays = markov.says.myBind(breakfast);
// console.log(notMarkovSays("meow", "me")) === "Breakfast says meow to me!";
function mySum(array) {
  let sum = 0;

  array.forEach((el) => {
    sum += el;
  });

  return sum;
}

// Curry sum

function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length == numArgs) {
      return mySum(numbers);
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

const cSum = curriedSum(4);
// console.log(cSum(5)(30)(20)(1)); // => 56



// Function.prototype.curry
// Write a method Function.prototype.curry(numArgs). This should return a function that will:
//
// Collect up arguments until there are numArgs of them,
// If there are too few arguments still, it should return itself.
// When there are numArgs arguments, it should call the original function.
// Write a version that uses Function.prototype.apply and another one that uses the spread ... operator.
// ** Make sure to call a TA to check over your work if you haven't already! **
Function.prototype.curry = function(numArgs) {
  const numbers = [];
  const self = this;

  function _curry(n) {
    numbers.push(n);
    if (numbers.length == numArgs) {
      return self(numbers);
    } else {
      return _curry;
    }
  }

  return _curry;
}

let t = mySum.curry(4);
console.log(t(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  const numbers = [];
  const self = this;

  function _curry(n) {
    numbers.push(n);
    if 
  }

  return _curry;
}
