require 'byebug'

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    foundation_values = []
    self.cards.each do |card|
      foundation_values << card.value
      return false if card.suit != suit
    end

    Card.values.sort == foundation_values.sort
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    curr_card = @cards.last

    if @cards.empty?
      if card.value == :ace && suit == card.suit
        return true
      else
        return false
      end
    else
      if card.rank - curr_card.rank == 1
        return true
      else
        return false
      end
    end
  end

end
