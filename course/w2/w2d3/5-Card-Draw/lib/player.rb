require 'byebug'
require_relative 'hand'
require_relative 'deck'

class Player

  attr_reader :name

  def initialize(name, deck)
    @name = name
    @hand = Hand.new(deck, self)
    @bet, @wallet = 0, 100
  end

  def prompt
    puts "Would you like to raise, discard cards, or fold?"
    puts "raise: 'c', raise: 'r', discard: 'd', fold: 'f'"
    print ">"
    input = gets.chomp
    case input
    when "c"
      check
    when "r"
      bet
    when "d"
      discard
    when "f"
      fold
    else
      "You goofed!"
    end
  end

  def check
  end

  def discard
    puts "Please type the indicies of the cards you would like to discard: 0,1,4"
    print ">"
    card_idxs = gets.chomp
    card_idxs.chars.map(&:to_i)

    card_idxs.each do |idx|
      @hand.delete_at(idx)
    end

    card_idxs.length.times { draw_card }
  end

  def bet(raise_by = 10)
    @bet += raise_by
    @wallet -= raise_by
    [@bet, @wallet]
  end

  def fold
    false
  end

  def draw_card
    @hand.draw_card
  end
end
