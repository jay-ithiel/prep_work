const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {   
    reader.question("Give us a number \n", function(num) {
      num = parseInt(num);
      sum += num;
      console.log(sum);
      addNumbers(sum, --numsLeft, completionCallback);
    });
  } else if (numsLeft == 0) {
    completionCallback(sum);
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
