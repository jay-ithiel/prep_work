class Card
  attr_reader :face_up, :face_value

  def initialize(face_value)
    @face_up = false
    @face_value = face_value
  end

  def display_information
    if @face_up
      @face_value
    else
      'X'
    end
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def ==(second_card)
    @face_value == second_card.face_value
  end

end
