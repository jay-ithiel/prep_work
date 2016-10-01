require 'byebug'
require_relative 'module_hand_rules'
require_relative 'deck'
# The logic of calculating pair, three-of-a-kind, two-pair, etc.
# goes here. Logic of which hand beats which would go here.

class Hand
  extend HandRules
  attr_accessor :hand
  attr_reader :suit_hash, :value_hash, :player, :deck

  def initialize(deck, player)
    @player = player
    @deck = deck
    @hand = []
    reset_hand
  end

  def convert_to_hash
    hand.each do |card|
      @suit_hash[card.suit] += 1
      @value_hash[card.value] += 1
    end
  end

  def reset_hand
    @suit_hash = Hash.new { |h, k| h[k] = 0 }
    @value_hash = Hash.new { |h, k| h[k] = 0 }
    @hand = @hand.sort_by { |card| card.value }
  end

  def draw_card
    @hand << @deck.draw_card
    reset_hand
    convert_to_hash
  end
end

# deck = Deck.new
# a = Hand.new(deck, "Mike")
# b = Hand.new(deck, "Jay")
# c = Hand.new(deck, "Sabrina")
# 5.times do
#   a.draw_card
#   b.draw_card
#   c.draw_card
# end
# p a.value_hash
# p b.value_hash
# p c.value_hash
# p a.suit_hash
# p b.suit_hash
# p c.suit_hash
# p Hand.winning_hand(a, b, c)
#
# repeats = Hash.new{|h,k| h[k] = 0}
# deck = Deck.new
# a = Hand.new(deck, "Mike")
# until Hand.declare_hand_type(a)[0] == :royal_flush
#   deck = Deck.new
#   a = Hand.new(deck, "Mike")
#   5.times do
#     a.draw_card
#   end
#   repeats[Hand.declare_hand_type(a)[0]] += 1
# end
# p repeats
