require_relative 'card'

class Deck
  attr_reader :deck, :discarded_cards

  def initialize
    @deck = Card.generate_cards
    shuffle
  end

  def shuffle
    @deck.shuffle!
  end

  def length
    @deck.length
  end

  def [](pos)
    @deck[pos]
  end

  def draw_card
    @deck.pop
  end

  def reset_deck
    @deck = Card.generate_cards
  end
end
