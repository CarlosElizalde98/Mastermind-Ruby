class GameBoard
  def initialize(player, player_two)
    @player_one = player
    @player_two = player_two
    @correct_guesses = {:white => 0, :red => 0}
    @spaces = []
    @guesses = []
  end

  def print_board
    
  end

  def check_board(guesses)
    @guesses.concat(guesses)
    correct = @player_two.secret_code
    guess_calculator(@guesses, correct)
    reset_guesses
  end

  def guess_calculator(guesses, secret_code)
    reset_correct_guesses
    guesses.each_with_index { |guess, index|
      if secret_code.include?(guess)
        if guess == secret_code[index]
          @correct_guesses[:red] += 1
        else
          @correct_guesses[:white] += 1
        end
      end
      }
  end

  def reset_correct_guesses
    @correct_guesses = {:white => 0, :red => 0}
  end

  def reset_guesses
    @guesses = []
  end

end