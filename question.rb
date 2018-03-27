class Question
  attr_reader :left_val, :right_val, :answer

  def initialize(max)
    randomQuestion(max)
  end

  private 
  def randomNum(max)
    return 1 + rand(max)
  end

  def randomQuestion(max)
    @left_val = randomNum(max)
    @right_val = randomNum(max)
    @answer = @left_val + @right_val
  end
end