// function sum() {
//   let arr = Array.from(arguments);
//   let sum = 0;
//   arr.forEach((num) => sum += num);
//   return sum;
// }
// //
// // console.log(sum(1, 2, 3, 4));
//
// function sum(...args) {
//   let sum = 0;
//   args.forEach((num) => sum += num);
//   return sum;
// }
// //
// // console.log(sum(...[1, 2, 3, 4]));
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
// Function.prototype.myBind = function(context) {
//   let arr = Array.from(arguments);
//   let myThis = this;
//   return function() {
//     let args = arr.slice(1);
//     let new_arr = Array.from(arguments);
//     let args = args.concat(new_arr);
//     myThis.apply(context, args);
//   }
// }
//
// Function.prototype.myBind = function(context, ...args) {
//   let myThis = this;
//   return function(...args2) {
//     let sum_args = args.concat(args2);
//     myThis.apply(context, sum_args);
//   }
// }

// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
//
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
//
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
//
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!

// function curriedSum(numArgs) {
//   let numbers = [];
//
//   function _curriedSum(num) {
//     numbers.push(num);
//     if (numbers.length === numArgs) {
//       let sum = 0;
//       numbers.forEach((num) => sum += num);
//       return sum;
//     } else {
//       return _curriedSum;
//     }
//   }
//
//   return _curriedSum;
// }
//
// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let myThis = this;
  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return myThis.apply(null, numbers);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree.curry(3)(4)(20)(6));

// console.log(func(6)); // == 30
