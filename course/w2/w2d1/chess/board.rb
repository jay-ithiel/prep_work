require 'byebug'
require 'colorize'
require_relative 'pieces'

class Board

  attr_reader :grid, :size

  def initialize(size = 8)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    populate
  end

  def populate

    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    @grid.each_with_index do |row, i|

      if i == 0 || i == self.size-1
        row.each_with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = pieces[j].new(curr_pos, self)
        end
      elsif i == 1 || i == size - 2
        row.each.with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = Pawn.new(curr_pos, self)
        end
      else
        row.each.with_index do |col, j|
          curr_pos = [i, j]
          self[curr_pos] = NullPiece.instance
        end
      end

    end

  end

  def move(start, end_pos)
    piece = self[start]
    raise ArgumentError.new "This position is empty!" if piece.is_a?(NullPiece)
    self[end_pos] = piece
    self[start] = NullPiece.new
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

end
