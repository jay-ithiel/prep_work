require 'byebug'
require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  attr_reader :cursor_pos, :board

  def initialize(board)
    @cursor_pos = [0,0]
    @board = board
    @cursor = Cursor.new(@cursor_pos, @board)
  end
  # :color => :light_blue, :background => :red

  def render
    puts "  #{("a".."h").to_a.map{|n| n.to_s.colorize(:green)}.join(" ")}"
    i = @board.size
    @board.grid.each_with_index do |row, idx1|
      print "#{i} ".colorize(:green)

      values = []
      row.each_with_index do |col, idx2|
        current_pos = [idx1, idx2]
        if (current_pos == @cursor.cursor_pos)
          values << col.symbol.to_s.colorize(:blue)
        else
          unless col.is_a?(NullPiece)
            if (col.player.color == :white)
              values << col.symbol.to_s.colorize(:white)
            else
              values << col.symbol.to_s.colorize(:yellow)
            end
          else
            values << col.symbol.to_s.colorize(:red)
          end
        end
      end
      puts values.join(" ")
      i-= 1
    end
    ''
  end

  def get_cursor_input
    render
    @cursor.get_input
  end
end
