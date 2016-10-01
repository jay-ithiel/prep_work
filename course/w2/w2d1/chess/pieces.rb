require 'byebug'
require 'singleton'

class Piece

  attr_reader :moves, :pos, :board

  def initialize(pos, board)
    @pos, @board = pos, board
  end

  def moves
    # return array of places the piece can move to
  end
end

class NullPiece < Piece
  include Singleton

  attr_reader :symbol

  def initialize
    @symbol = '_'
  end

end

class SlidingPiece < Piece

  def initialize(pos, board)
    super
  end

  def moves(move_dirs, pos)
    possible_moves = []
    curr_row, curr_col = pos

    move_dirs.each do |move_dir|
      while true
        row_diff, col_diff = move_dir
        new_row = curr_row + row_diff
        new_col = curr_col + col_diff
        possible_move = [new_row, new_col]

        break if new_row >= @board.size || new_row < 0
        break if new_col >= @board.size || new_col < 0
        break unless @board[possible_move].is_a(NullPiece)

        possible_moves << possible_move
      end
    end

    possible_moves
  end
end

class SteppingPiece < Piece

  def initialize(pos, board)
    super
  end
end


class Queen < SlidingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♕
  end

  def move_dirs
    [[1,1], [-1, -1], [1, -1], [-1, 1], [0,1], [0, -1], [1,0], [-1,0]]
  end

  def moves
    super(move_dirs, self.pos)
  end

end

class Bishop < SlidingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♗
  end

  def move_dirs
    [[1,1], [-1, -1], [1, -1], [-1, 1]]
  end

  def moves
    super(move_dirs, self.pos)
  end

end

class Rook < SlidingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♖
  end

  def move_dirs
    [[0,1], [0, -1], [1,0], [-1,0]]
  end

  def moves
    super(move_dirs, self.pos)
  end

end





class Pawn < SteppingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♙
  end
end

class King < SteppingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♔
  end
end

class Knight < SteppingPiece

  attr_reader :symbol

  def initialize(pos, board)
    @symbol = :♘
  end
end
