class Player
  attr_accessor :name
  attr_reader :life

  def initialize(name)
    @name = name
    @life = 3
  end

  def to_s
    @name
  end

  def decrementLife()
    @life -= 1
  end

end
