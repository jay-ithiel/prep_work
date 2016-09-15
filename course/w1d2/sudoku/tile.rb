require 'colorize'

class Tile
  attr_accessor :value

  def initialize(value = '_')
    @value = value
    @given = value.is_a(Integer) ? true : false
  end

  def to_s
    if @given
      @value.colorize(:red)
    else
      @value.colorize(:white)
    end
  end

end
