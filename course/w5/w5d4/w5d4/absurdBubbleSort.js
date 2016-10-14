const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? \n`, (ans) => callback(ans === 'true'));
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){

  if( i < arr.length - 1 ){
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {

      if(isGreaterThan){
        let temp = arr[i];

        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      } else { madeAnySwaps = false; }
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
    });

  }

  if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if(madeAnySwaps){
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

// askIfGreaterThan(1, 4, (n) => n ? console.log('t') : console.log('f'));

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
