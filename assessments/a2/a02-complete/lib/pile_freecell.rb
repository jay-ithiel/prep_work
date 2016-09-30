class FreeCell < Pile
  def to_s
    empty? ? "[  ]" : "[#{top_card}]"
  end

  def valid_move?(card)
    return true if self.empty?
  end
end
