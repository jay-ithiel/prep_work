require_relative 'card'
require 'byebug'

class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    @deck = Card.all_cards
    @move_history = []
    deal_tableau
    # ...
  end

  def deal_tableau
    tableau_idx = 0
    @deck.each do |card|
      tableau_idx = 0 if tableau_idx > 7
      @tableau[tableau_idx] << card
      tableau_idx += 1
    end
  end

  def move!(from_pile, to_pile)
    card = from_pile.cards.pop
    to_pile.cards << card
  end

  def move(from_pile, to_pile)
    raise "invalid move " if to_pile.count > 0
    move!(from_pile, to_pile)
    @move_history << [from_pile, to_pile]
  end

  def undo_move
    raise "no moves have been made" if move_history.empty?
    prev_move = @move_history.pop
    from_pile, to_pile = prev_move
    move(to_pile, from_pile)
    @move_history.pop
  end

  def valid_move?(from_pile, to_pile)
    if from_pile.empty?
      return false
    else
      to_pile.valid_move?(from_pile.top_card)
    end
  end

  def won?
    return false if @foundations.any? { |foundation| foundation.empty? }
    @foundations.each do |foundation|
      return false unless foundation.complete?
    end
    true
  end
end
