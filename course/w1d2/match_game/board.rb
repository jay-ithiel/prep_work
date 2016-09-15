require_relative 'card'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(4) { Array.new(4) }
    populate
  end

  def populate
    cards = gen_cards
    card_idx = 0

    @grid.length.times do |i1|
      @grid.length.times do |i2|
        self[[i1, i2]] = cards[card_idx]
        card_idx += 1
      end
    end

  end

  def gen_cards
    cards_arr = []

    num_of_cards = (@grid.length ** 2) / 2
    card_values = ('a'..'h').to_a

    card_values.length.times do |card_idx|
      card = Card.new(card_values[card_idx])
      card2 = card.dup
      cards_arr.push(card, card2)
    end

    cards_arr.shuffle
  end

  def render
    @grid.each do |row|
      row_arr = []

      row.each.with_index do |card, i|
        row_arr << card.display_information
      end

      puts row_arr.join(' ')
    end
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false if !card.face_up
      end
    end
    true
  end

  def reveal_card(guessed_pos)
    card = self[guessed_pos]
    card.reveal unless card.face_up
    card.face_value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  private

    def []=(pos, card)
      row, col = pos
      @grid[row][col] = card
    end

end
