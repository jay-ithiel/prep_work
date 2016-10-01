require 'byebug'
require_relative 'board'
require_relative 'display'

class HumanPlayer

  attr_reader :name, :color
  attr_accessor :piece_in_hand, :piece_dropped

  def initialize(name, color)
    @name = name
    @color = color
    @piece_in_hand = false
    @piece_dropped = false
  end

  def prompt
    puts "Which piece would you like to move?"
  end

  def play_turn
    prompt
  end

  def piece_in_hand?
    @piece_in_hand
  end

  def pick_up(cursor_pos)
  end

  def piece_dropped?
    @piece_dropped
  end

  def drop(cursor_pos)
  end

end
