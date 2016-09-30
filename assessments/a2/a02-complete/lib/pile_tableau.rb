class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    curr_card = self.cards.last

    if self.cards.empty?
      return true
    else
      # return false if curr_card.suit== card.color
      if curr_card.rank - card.rank == 1
        return true if curr_card.color != card.color
      else
        return false
      end
    end
  end
end
