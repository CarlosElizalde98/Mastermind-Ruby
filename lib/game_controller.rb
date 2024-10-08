require_relative 'game_board'
require_relative 'code_master'
require_relative 'code_breaker'

class GameController
  def initialize
    @game_end = false
    @turns = 12
    @player = CodeBreaker.new('Player')
    @comp = CodeMaster.new('Computer')
    @game_board = GameBoard.new(@player, @comp)
  end

  def play
    welcome_message
    @comp.generate_secret_code
    turn_number = 0
    until turn_number == 12 || @game_end == true
      player_input(turn_number)
      turn_number += 1
      is_game_over?(turn_number)
    end
  end

  def player_input(turn)
    puts "Pick out four colors for turn #{turn + 1}"
    guess = gets.chomp.downcase
    guess_array = guess.split(' ')
    @game_board.check_board(guess_array)
  end

  def welcome_message
    puts "Welcome to Mastermind! Pick out four colors from red, green, blue, and yellow and guess what the secret code is!"
  end
  
  def is_game_over?(turn_number)
    if turn_number == 12 && @game_end == false
      game_over(@comp, turn_number)
    elsif @game_board.correct_guesses.length == 4 && @game_board.correct_guesses.values.all?{|value| value == "Red"}
      game_over(@player, turn_number)
    end
  end

  def game_over(player, turn_number)
    @game_end = true
    puts "#{player.name} has won! The turn number was #{turn_number}. The secret code was #{@comp.secret_code} "
  end
  
end

test = GameController.new
test.play