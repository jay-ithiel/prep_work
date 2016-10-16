// # Back in the good old days, you used to be able to write a darn near
// # uncrackable code by simply taking each letter of a message and
// incrementing it by a fixed number, so "abc" by 2 would look like "cde",
// wrapping around back to "a" when you pass "z".  Write a function,
// `caesar_cipher(str, shift)` which will take a message and an increment
// amount and outputs the encoded message. Assume lowercase and no
// punctuation. Preserve spaces.
// To get an array of letters "a" to "z", you may use `("a".."z").to_a`.
// To find the position of a letter in the array, you may use
// `Array#find_index`.

function caesarCipher(str, shift) {
  let ciphedStr = "";

  for (let i = 0; i < str.length; i++) {
    let currLetter = str[i];

    if (currLetter.match(/[a-z]/i)) {
      let ciphedLetter = ciphe(str[i], shift);
      ciphedStr += ciphedLetter;
    } else {
      ciphedStr += currLetter;
    }
  }

  return ciphedStr;
}

function ciphe(letter, shift) {
  const alphabet = "abcdefghijklmnopqrstuvwxyz".split('');
  let letterIdx = alphabet.indexOf(letter);
  let newIdx = letterIdx += shift;
  newIdx > 25 ? newIdx -= 26 : newIdx;
  return alphabet[newIdx];
}

// console.log(caesarCipher('hello world', 5));
// console.log(caesarCipher('zab', 1));

// # Write a method, `digital_root(num)`. It should Sum the digits of a
// positive integer. If it is greater than 10, sum the digits of the
// resulting number. Keep repeating until there is only one digit in the
// result, called the "digital root". **Do not use string conversion
// within your method.** You may wish to use a helper function,
// `digital_root_step(num)` which performs one step of the process.






// # Jumble sort takes a string and an alphabet. It returns a copy of the
// string with the letters re-ordered according to their positions in the
// alphabet. If no alphabet is passed in, it defaults to normal
// alphabetical order (a-z).
// # Example:
// # jumble_sort("hello") => "ehllo"
// # jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

function jumbleSort(str, alphabet) {
  let jumbled = "";

  for (let i = 0; i < alphabet.length; i++) {
    let re = new RegExp(`${alphabet[i]}`, 'g');
    let matched = str.match(re);
    if (matched === null) { continue }
    jumbled += matched.join('');
    str.replace(`${matched[0]}`, '');
  }

  return jumbled;
}

// console.log(jumbleSort('hello', ['o', 'l', 'h', 'e']));


// class Array
// Write a method, `Array#two_sum`, that finds all pairs of positions
// where the elements at those positions sum to zero.
// # NB: ordering matters. I want each of the pairs to be sorted smaller
// index before bigger index. I want the array of pairs to be sorted
// "dictionary-wise":
// [0, 2] before [1, 2] (smaller first elements come first)
// [0, 1] before [0, 2] (then smaller second elements come first)

Array.prototype.two_sum = function() {
  let zeros = [];

  for (let i = 0; i < this.length-1; i++) {
    for (let j = i+1; j < this.length; j++) {
      let n1 = this[i], n2 = this[j];
      if (n1 + n2 == 0) { zeros.push([i,j]); }
    }
  }

  zeros = zeros.sort((a, b) => { a[0] - b[0] });
  return zeros;
}

// let arr = [5, 3, -5, 4, -3, 0, -3, -3, 3];
// console.log(arr.two_sum());



// class String
// Returns an array of all the subwords of the string that appear in the
// dictionary argument. The method does NOT return any duplicates.
// Write a method that returns the factors of a number in ascending order.

String.prototype.subwords = function(dictionary) {

}




// class Array
// Monkey patch the Array class and add a my_inject method. If my_inject
// receives no argument, then use the first element of the array as the
// default accumulator.

Array.prototype.my_inject = function(callback, accumulator) {
  if (!accumulator) { accumulator = this.shift(); }

  this.forEach(function(element) {
    accumulator = callback(accumulator, element);
  });

  return accumulator;
}

// let arr = [1,2,3,4,5];
// console.log(arr.my_inject((a,b) => { return a + b } ));




// primes(num) returns an array of the first "num" primes.
// You may wish to use an is_prime? helper method.

function primes(num) {
  let numPrimes = [];

  for (let n = 2; numPrimes.length < num; n++) {
    if (isPrime(n)) { numPrimes.push(n) }
  }

  return numPrimes;
}

function isPrime(num) {
  if (num < 2) { return false }

  for (let div = 2; div < num; div++) {
    if (num % div == 0) { return false }
  }

  return true;
}

// console.log(primes(5));







// Write a recursive method that returns the first "num" factorial numbers.
// Note that the 1st factorial number is 0!, which equals 1. The 2nd
// factorial is 1!, the 3rd factorial is 2!, etc.
//  4 => [1,1,2,6]
// 3 * 2
// 2 *

function numFactorials(num) {
  if (num === 0) { return 1 }
  let factorials = [];
  let factorial = numFactorials(num-1);
  factorials.push(factorial);
  return factorials;
}







// class Array
// Write an Array//dups method that will return a hash containing the
// indices of all duplicate elements. The keys are the duplicate elements;
// the values are arrays of their indices in ascending order, e.g.
// [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }









// class String
// Write a String#symmetric_substrings method that returns an array of
// substrings that are palindromes,
// e.g. "cool".symmetric_substrings => ["oo"]
// Only include substrings of length > 1.










//class Array
// Write an Array#merge_sort method; it should not modify the original
// array.








// class Array
// Write a method that binary searches an array for a target and returns
// its index if found. Assume a sorted array
// NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every
// time). We will not give you points if you visit every element in the
// array every time you search.\
// For example, given the array [1, 2, 3, 4], you should NOT be checking
// 1 first, then 2, then 3, then 4.







// class Array
// Write a new `Array#pair_sum(target)` method that finds all pairs of
//positions where the elements at those positions sum to the target.
// NB: ordering matters. I want each of the pairs to be sorted
// smaller index before bigger index. I want the array of pairs to be
//sorted "dictionary-wise":
//  [0, 2] before [1, 2] (smaller first elements come first)
//   [0, 1] before [0, 2] (then smaller second elements come first)







// Write a method called 'sum_rec' that
// recursively calculates the sum of an array of values







// class String
//Write a `String#symmetric_substrings` method that returns all
//substrings which are equal to their reverse image ("abba" ==
//"abba"). We should only include substrings of length > 1.








// Write a method that sums the first n prime numbers starting with 2.







// class Array
// Write a method that calls a passed block for each element of the array







// class Array
//Write a method that returns the first element that causes the passed
// block to evaluate to `true`
