
class HumanPlayer
  def initialize(name, board)
    @name = name
    @board = board
  end

  def prompt
    # @board = board
    puts "Please choose a position to mark, and a value: row,col,value"
    input = gets.chomp.split(",")
    pos = input
    first_guess = prompt until valid_pos?(first_guess)
    first_guess = first_guess.map { |n| n.to_i }
  end

  def valid_pos?(guess)
    guess.each do |n|
      return false if n.match(/[0-9]/i) == nil
      return false if n.to_i > @board.grid.length - 1
    end
    true
  end
end




class ComputerPlayer
  attr_reader :known_cards

  def initialize(name, board)
    @name = name
    @board = board
    @known_cards = Hash.new { [] }
    @first_guess = nil
  end

  def prompt
    positions = @known_cards.values.select { |value| value.length == 2 }
    if !positions.empty?
      find_matching_positions(positions)
    else
      guess = rand_guess
      guess = rand_guess until card_down?(guess)
      guess
    end
  end

  def find_matching_positions(positions)
    if @first_guess == nil
      @first_guess = positions[0][0]
    else
      @first_guess = nil
      @known_cards.delete_if { |k, v| v.include?(positions[0][1]) }
      positions[0][1]
    end
  end

  def rand_guess
    row = rand(@board.grid.length)
    col = rand(@board.grid[0].length)
    [row, col]
  end

  def card_down?(pos)
    @board[pos].face_up == false
  end

  def receive_revealed_card(pos, value)
    @known_cards[value] << [pos]
  end

end
