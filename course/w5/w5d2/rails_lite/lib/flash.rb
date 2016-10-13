require 'json'

class Flash
  def initialize(req)
    @req = req
  end

  def []=(key, value)
    self[key] = value
  end
end
