require 'byebug'
require 'singleton'
require_relative 'player'

class Piece

  attr_reader :moves, :pos, :board, :player

  def initialize(pos, board, player)
    @pos, @board, @player = pos, board, player
    # @moves = moves
  end

  def set_board(new_board)
    @board = new_board
  end

  def moves
    # return array of places the piece can move to
    #handle
  end

  def get_valid_moves
    valid_moves = []
    dup_board = @board.deep_dup

    moves.each do |move|
      piece = self
      current_pos = piece.pos
      dup_board.move!(current_pos, move)
      # piece.pos = move
      valid_moves << move unless dup_board.in_check?(player.color)
    end

    valid_moves
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

  def initialize(*args)
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
        break unless @board[possible_move].is_a?(NullPiece)

        current_piece = @board[possible_move]
        unless current_piece.is_a?(NullPiece)
          break if current_piece.player == self.player
          if current_piece.player != self.player
            possible_moves << possible_move
            break
          end
        end

        possible_moves << possible_move
      end
    end

    possible_moves
  end
end

class SteppingPiece < Piece

  def initialize(*args)
    super
  end

  def moves(move_diffs, pos)
    possible_moves = []

    move_diffs.each do |move_diff|
      curr_row, curr_col = pos
      row_diff, col_diff = move_diff
      new_row = curr_row + row_diff
      new_col = curr_col + col_diff
      new_pos = [new_row, new_col]
      if board.in_bounds?(new_pos)
        current_piece = board[new_pos]
        next if current_piece.is_a?(NullPiece)
        next if current_piece.player == self.player
        possible_moves << new_pos
      end

    end

    possible_moves
  end

end


class King < SteppingPiece

  attr_reader :symbol

  def initialize(*args)
    super
    @symbol = :♔
  end

  def move_diffs
    [[0,1], [0, -1], [1,0], [-1,0], [1,1], [-1, -1], [1,-1], [-1,1]]
  end

  def moves
    super move_diffs, self.pos
  end
end

class Knight < SteppingPiece

  attr_reader :symbol

  def initialize(*args)
    super
    @symbol = :♘
  end

  def move_diffs
    nums = [-2, -1, 1, 2]
    diffs = []
    nums.each_with_index do |num1, i|
      nums.each_with_index do |num2, j|
        unless (num1.abs == num2.abs)
          diffs << [num1, num2]
        end
      end
    end
    diffs
  end

  def moves
    super move_diffs, self.pos
  end
end


class Pawn < Piece

  attr_reader :symbol

  def initialize(*args)
    super
    @symbol = :♙
    @first_move = true
  end

  def move_diffs
    if (self.player.color == :white)
      [[1,0], [2,0], [1,-1], [1,1]]
    else
      [[-1,0], [-2,0], [-1,-1], [-1,1]]
    end
  end

  def at_start_row?
    row, col = self.pos
    if self.player.color == :black
      return true if row == board.size - 2
    elsif self.player.color == :white
      return true if row == 1
    end
    false
  end

  def moves
    possible_moves = []
    current_row, current_col = self.pos

    move_diffs.each_with_index do |move_diff, i|
      next if i == 1 unless at_start_row?
      row_diff, col_diff = move_diff
      new_row = current_row + row_diff
      new_col = current_col + col_diff
      new_pos = [new_row, new_col]

      next unless @board.in_bounds?(new_pos)
      current_piece = @board[new_pos]

      unless current_piece.is_a?(NullPiece)
        next if current_piece.player == self.player
      end

      possible_moves << new_pos
    end

    possible_moves
  end

end



class Queen < SlidingPiece

  attr_reader :symbol

  def initialize(*args)
    super
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

  def initialize(*args)
    super
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

  def initialize(*args)
    super
    @symbol = :♖
  end

  def move_dirs
    [[0,1], [0, -1], [1,0], [-1,0]]
  end

  def moves
    super(move_dirs, self.pos)
  end

end
