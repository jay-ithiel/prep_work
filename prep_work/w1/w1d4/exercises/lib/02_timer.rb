class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
    @hours, @minutes, @seconds =
    hours,  minutes,  remain_seconds
  end

  def hours
    @hours = @seconds / 3600
  end

  def minutes
    @minutes = (@seconds % 3600) / 60
  end

  def remain_seconds
    @seconds = (@seconds % 3600) % 60
  end

  def time_string
    "#{padded(hours)}:#{padded(minutes)}:#{padded(remain_seconds)}"
  end

  def padded(n)
    n < 10 ? "0#{n}" : "#{n}"
  end
end
