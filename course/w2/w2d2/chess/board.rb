require 'byebug'
require 'colorize'
require_relative 'pieces'


class Board

  attr_reader :grid, :size, :player_one, :player_two, :start_pos, :end_pos
  # attr_accessor :piece_in_hand, :piece_dropped

  def initialize(player_one, player_two, size = 8)
    @size, @player_one, @player_two = size, player_one, player_two
    @grid = Array.new(size) { Array.new(size) }
    # @piece_in_hand = false
    # @piece_dropped = false
    populate
  end

  def populate
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    player = player_one
    @grid.each_with_index do |row, i|

      player = player_two if i >= @size / 2

      if i == 0 || i == self.size-1
        row.each_with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = pieces[j].new(curr_pos, self, player)
        end
      elsif i == 1 || i == size - 2
        row.each.with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = Pawn.new(curr_pos, self, player)
        end
      else
        row.each.with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = NullPiece.instance
        end
      end

    end
  end

  # def piece_in_hand?
  #   @piece_in_hand
  # end
  #
  # def valid_pick_up?(cursor_pos)
  #   piece = self[cursor_pos]
  #   return false if piece.is_a?(NullPiece)
  #   true
  # end
  #
  # def pick_up(cursor_pos)
  #   @piece_in_hand = true
  #   @start_pos = cursor_pos
  # end
  #
  # def drop(cursor_pos)
  #   @end_pos = cursor_pos
  # end

  def move(start, end_pos)
    piece = self[start]

    raise ArgumentError.new "This position is empty!" if piece.is_a?(NullPiece)
    valid_moves = piece.get_valid_moves
    if valid_moves.any? { |pos| pos == end_pos }
      raise ArgumentError.new "You cannot move there, because you will be in check"
    end
    self[end_pos] = piece
    self[start] = NullPiece.instance
    @piece_in_hand = false
    @piece_dropped = true
  end

  def move!(start, end_pos)
    piece = self[start]
    raise ArgumentError.new "This position is empty!" if piece.is_a?(NullPiece)
    self[end_pos] = piece
    self[start] = NullPiece.instance
    piece.pos = end_pos
  end

  def validate_move(start, end_pos)
    begin
      move(start, end_pos)
    rescue ArgumentError => e
      puts "There is no piece at that position: #{start}!"
      puts "ERROR: #{e.message}"
      retry
    end
    #handle end position validation
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def in_bounds?(pos)
    pos.all? do |position|
     position < @size && position >= 0
   end
  end

  def deep_dup
    dup_board = Board.new(self.player_one, self.player_two)

    grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        orig_pos = [row_idx, col_idx]
        if col.is_a?(NullPiece)
          dup_board[orig_pos] = NullPiece.instance
        else
          dup_board[orig_pos] = col.clone
        end
      end
    end

    dup_board
  end

  def in_check?(color)
      king = get_king(color)
      enemy_pieces = get_enemy_pieces(color)
      enemy_piece_moves = get_enemy_moves(enemy_pieces)

      enemy_piece_moves.each do |enemy_move|
        return true if enemy_move == king.pos
      end

    false
  end

  def checkmate?(color)
    king = get_king(color)
    valid_moves = king.get_valid_moves
    return true if in_check?(color) && valid_moves.empty?
    false
  end

  def get_enemy_pieces(color)
    enemy_pieces = []

    grid.each do |row|
      row.each do |col|
        next if col.is_a?(NullPiece)
        next if col.player.color == color
        enemy_pieces << col
      end
    end

    enemy_pieces
  end

  def get_enemy_moves(pieces)
    enemy_moves = []

    pieces.each do |piece|
      curr_piece_moves = piece.get_valid_moves
      enemy_moves += curr_piece_moves
    end

    enemy_moves
  end

  def get_king(color)
    king = nil

    grid.each do |row|
      row.each do |col|
        next if col.is_a?(NullPiece)
        if col.is_a?(King)
          king = col if col.player.color == color
        end
      end
    end

    king
  end

end
