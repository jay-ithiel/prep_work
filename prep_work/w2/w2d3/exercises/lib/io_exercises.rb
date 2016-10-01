# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  secret_num = rand(100) + 1
  guess_count = 0
  match_bool = false

  puts "Guess a number!"

  until match_bool do
    guess_num = Integer(gets.chomp)
    guess_count += 1

    if guess_num == secret_num
      match_bool = true
      puts "The number you guessed was correct!"
      puts "The secret number was #{secret_num}, and it took you #{guess_count} tries."
    elsif guess_num > secret_num
      puts "Your number is #{guess_num}. It's too high! Guess again!"
    else guess_num < secret_num
      puts "Your number is #{guess_num}. It's too low! Guess again!"
    end

  end
end
