require 'byebug'

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # def get_difficulty
  #   puts "Welcome, #{player.name}"
  #   puts "How big of a board?"
  #   size = gets.chomp.to_i
  #   puts "How many bombs?"
  #   bomb_count = gets.chomp.to_i
  #
  #   [size, bomb_count]
  # end

  def prompt
    puts "Do you want to reveal or flag a tile?."
    puts "(Type 'r' to reveal, and 'f' to flag)."
    print ">> "
    action = gets.chomp!

    a = action == 'r' ? 'reveal' : 'flag'

    puts "Please enter the position of the tile you want to #{a}."
    puts "(Type the row, then column separated by a comma. ie: 3,5)"
    print ">> "
    pos = gets.chomp!

    user_input = "#{action} #{pos[0]},#{pos[2]}"
  end

  def get_move
    process_input(prompt)
  end

  def valid_play?(string)

  end

  def process_input(string)
    move = string.split(' ')
    oper = move.shift
    pos = move[0].split(',').map { |char| Integer(char) }
    [oper, pos]
  end
end
