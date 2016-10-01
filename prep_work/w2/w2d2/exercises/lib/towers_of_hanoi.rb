# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def play
    # Helper method that checks if player won
    # Helper method that checks if valid_move
    # Helper method that executes the move
    until won?
      p @towers
      p "Which pile would you like to pull from?"
      pull_index = gets.chomp!.to_i
      p "Which pile would you like to place the disc?"
      push_index = gets.chomp!.to_i

      if valid_move?(pull_index, push_index)
        move(pull_index, push_index)
      else
        p 'Invalid move'
      end
    end
    p "You won!" #if won?
  end


    def won?
      win_pile = @towers.select { |pile| !pile.empty? }
      if @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
        return true if win_pile === win_pile.sort
      end
      false
    end

    def valid_move?(pull_index, push_index)
      disc_to_pull = @towers[pull_index].last
      disc_to_push = @towers[push_index].last
      return true if disc_to_push == nil
      return false if disc_to_pull == nil || disc_to_pull == ''
      disc_to_push > disc_to_pull ? true : false
    end

    def move(from_tower, to_tower)
      disc_to_pull = @towers[from_tower].pop
      @towers[to_tower].push(disc_to_pull)
    end

end
