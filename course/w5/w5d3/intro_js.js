"use strict"
//
// Array.prototype.myUniq = function(){
//   uniq = [];
//   for (let i = 0; i < this.length; i++) {
//     if(!uniq.includes(this[i])){
//       uniq.push(this[i]);
//     }
//   }
//   return uniq;
//
// }
//
// //arr = [1,1,2,3, 5, 8, 1, 2, 4];
// //console.log(arr.myUniq());
//
// Array.prototype.twoSum = function(){
//   results = [];
//   for (let i = 0 ; i < this.length; i++){
//     if (this[i]+this[i+1] == 0){
//       results.push([i, i+1]);
//     }
//   }
//   return results;
// }
//
// // arr = [-1, 1, 5, 7, -4, 5];
// // console.log(arr.twoSum());
//
// Array.prototype.myTranspose = function() {
//   let full_transposed = [];
//   let el_idx = 0;
//   times = this.length;
//
//   for (let i = 0; i < times; i++) {
//     let transposed = []
//     for (let row_idx = 0; row_idx < this.length; row_idx++) {
//       transposed.push(this[row_idx][el_idx]);
//     }
//     el_idx ++;
//     full_transposed.push(transposed);
//   }
//
//   return full_transposed;
// }
// let rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]];
// //console.log(rows.myTranspose());
//
// Array.prototype.myEach = function(callback) {
//   this.forEach(callback);
// }
//
// arr = [-1, 1, 5, 7, -4, 5];
// //console.log(arr.myEach(function logArrayElements(element, index, array) {
// //  console.log('a[' + index + '] = ' + element);
// //}))
//
// Array.prototype.myMap = function(callback){
//   new_array = [];
//   new_array.push(this.myEach(callback));
//   return new_array;
// }
//
// // arr = [-1, 1, 5, 7, -4, 5];
// // console.log(arr.myMap(function logArrayElements(element, index, array) {
// //   console.log('a[' + index + '] = ' + element);
// // }))
//
//
// Array.prototype.myInject = function (callback, accumulator = null){
//   if (!accumulator){
//     accumulator = this.shift();
//   }
//
//   this.myEach(function (element) {
//     accumulator = callback(accumulator, element);
//   });
//   return accumulator;
// }
// const NUMS = [1, 2, 3, 4, 5];
//
// //console.log(NUMS.myInject( (total, item) => total - item ));
// function factors(number){
//   i = 0;
//   results = [];
//   while (i<=number) {
//     if (number%i == 0){
//       results.push(i);
//     }
//     i++;
//   }
//   return results;
// }
//
// //console.log(factors(24))
//
// function bubbleSort(array){
//   sorted = false;
//   while (!sorted){
//     sorted = true;
//
//     for (let i = 0; i < array.length-1; i++){
//       elem1 = array[i], elem2 = array[i+1];
//
//       if (elem1 > elem2) {
//         sorted = false;
//         array[i] = elem2;
//         array[i+1] = elem1;
//       }
//     }
//
//   }
//   return array;
// }
//
// a = [6,5,2,7,8,1,3,4]
// // console.log(bubbleSort(a));
//
//
// function substrings(string) {
//   res = [];
//
//   for (i = 0; i <= string.length; i++) {
//     for (j = i+1; j <= string.length; j++) {
//       substr = string.substring(i, j);
//       if (!res.includes(substr)) {
//         res.push(substr);
//       }
//     }
//   }
//
//   return res;
// }
//
// // console.log(substrings('cat'));
//
//
// // RECURSION
//
// function range(start, end) {
//   res = [];
//   if (start > end) { return res; }
//
//   res.push(start);
//   start++;
//   return res.concat(range(start, end));
// }
//
// //console.log(range(1,5));
// function exponents(b, n){
//   if (n== 0){
//     return 1
//   }
//   return b * exponents(b, n-1)
// }
//
// function exponents2(b, n){
//   if( n == 0 ){ return 1;}
//   if (n % 2 == 0){
//     return Math.pow ( (exponents2(b, n/2)), 2) ;
//   } else {
//     return b * Math.pow(exponents2 (b, (n-1)/2), 2 );
//   }
// }
// //console.log(exponents2(2,3))

function fib(n){
  if (n < 1){ return [];}
  if (n === 1){ return [1];}
  if (n === 2){ return [1,1]; }

  let prev_fibs = fib(n-1);
  let next_fib = prev_fibs.slice(-2).reduce((a,b) => a + b, 0);
  prev_fibs.push(next_fib);
  return prev_fibs
}

// console.log(fib(4));

function binarySearch(array, target){
  let middle_index = array.length / 2;
  let left = array.slice(0, middle_index);
  let right = array.slice(-middle_index);
  let middle = array[middle_index];

  if (target > middle){
    return middle_index + binarySearch(right, target);
  } else if (target === middle) {
    return middle_index;
  } else if (target < middle) {
    return binarySearch(left, target);
  }
}

// console.log(binarySearch([1,2,3,4,5,6,7,8], 8));


function mergeSort(array) {
  if (array.length <= 1) { return array };

  let mid_idx = Math.round(array.length / 2);
  let left = array.slice(0, mid_idx);
  let right = array.slice(mid_idx);

  // return mergeSort(left).concat(mergeSort(right));
  return mergeHelper(mergeSort(left), mergeSort(right));
}

function mergeHelper(left, right) {
  console.log([left, right])
  let sorted = [];

  while (left.length > 0 && right.length > 0) {
    let left_first = left[0];
    let right_first = right[0];

    // if (left_first === null || right_first === null) { break; }

    if (left_first > right_first) {
      sorted.push(right_first);
      right.shift();
    } else {
      sorted.push(left_first);
      left.shift();
    }
  }
  sorted = sorted.concat(left);
  sorted = sorted.concat(right);

  return sorted;
}
//

// console.log(mergeSort([5,2,5,6,9]));


function subsets(array) {
  if (array.length == 0) { return [[]]; }
  let sliced = array.slice(1);
  let prevSubsets = subsets(sliced);
  let newSubsets = [];
  for (let i = 0; i < prevSubsets.length; i++) {
    newSubsets.push(prevSubsets[i].concat(array[0]));
  }
  return prevSubsets.concat(newSubsets)
}

// console.log(subsets([1,2,3]));



function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(`${this.owner} loves ${this.name}!`);
}

let cat = new Cat('catty', 'human');
cat.cuteStatement();

Cat.prototype.cuteStatement = function() {
  console.log(`Everyone loves ${this.name}!`);
}
cat.cuteStatement();


Cat.prototype.meow = function() {
  console.log('meow');
}

let cat2 = new Cat('human', 'catter');
cat2.meow = function() {
  console.log('woof!');
}

cat.meow();
cat2.meow();
