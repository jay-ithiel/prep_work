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

  def render
    puts "  #{(0...@board.size).to_a.map{|n| n.to_s.colorize(:yellow)}.join(" ")}"
    @board.grid.each_with_index do |row, idx1|
      print "#{idx1} ".colorize(:yellow)

      values = []
      row.each_with_index do |col, idx2|
        current_pos = [idx1, idx2]
        if (current_pos == @cursor.cursor_pos)
          values << col.symbol.to_s.colorize(:blue)
        else
          values << col.symbol.to_s.colorize(:red)
        end
      end
      puts values.join(" ")
    end
    ''
  end


  def continue_render
    while true
      #system("clear")
      @cursor.get_input
      render
    end
  end
end
