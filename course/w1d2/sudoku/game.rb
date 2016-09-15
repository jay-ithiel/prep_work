require_relative 'board'
require_relative 'tile'
require_relative 'player'

class Game
  def initialize(board = Board.from_file)
    @board = board
  end

  def play
    until @board.solved?
      @board.render
    end
  end
end
