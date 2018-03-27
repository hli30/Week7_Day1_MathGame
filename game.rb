require './player'
require './question'
require './outputFormatter'
require './inputHandler'

class Game
  attr_reader :gameOver, :outputFormatter, :current_player
  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
    @gameOver = false

    @outputFormatter = OutputFormatter.new
  end

  def noMoreLife?
    @current_player.life <= 0
  end

  def checkAnswer(input, question)
    if input == question.answer
      isCorrect = true
      puts outputFormatter.formatResult(@current_player, isCorrect, @player1.life, @player2.life)
    else
      @current_player.decrementLife
      checkGameOver()
    end
  end

  def checkGameOver()
    if noMoreLife?
      @gameOver = true
      puts outputFormatter.formatGameEnd(@current_player, @current_player.life)
    else
      isCorrect = false
      puts outputFormatter.formatResult(@current_player, isCorrect, @player1.life, @player2.life)
    end
  end

  def switchPlayer()
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end

game = Game.new
inputHandler = InputHandler.new

while !game.gameOver
  question = Question.new(10)

  puts game.outputFormatter.formatQuestion(game.current_player.name, question.left_val, question.right_val)

  input = inputHandler.readInput.to_i

  game.checkAnswer(input, question)

  break if game.gameOver

  game.switchPlayer()
end