class OutputFormatter
  def formatQuestion(current_player, left_val, right_val)
    return "#{current_player}: What does #{left_val} plus #{right_val} equal?"
  end

  def formatResult(current_player, isCorrect, pOneLife, pTwoLife)
    if isCorrect
      outputString = "#{current_player}: YES! You are correct.\n"
    else
      outputString =  "#{current_player}: Seriously? No!\n"
    end
    outputString += "P1: #{pOneLife}/3 vs P2: #{pTwoLife}/3"
    return outputString
  end

  def roundDivider
    return "----- NEW TURN -----"
  end

  def formatGameEnd(current_player, current_player_life)
    outputString = "#{current_player} wins with a score of #{current_player_life}/3\n"
    outputString += "----- GAME OVER -----\n"
    outputString += "Good bye!"

    return outputString
  end

end