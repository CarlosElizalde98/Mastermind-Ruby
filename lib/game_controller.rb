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
    until turn_number == 2
      player_input(turn_number)
      turn_number += 1
    end
  end

  def player_input(turn)
    puts "Pick out four colors for turn #{turn}"
    guess = gets.chomp.downcase
    guess_array = guess.split(' ')
    @game_board.check_board(guess_array)
  end

  def welcome_message
    puts "Welcome to Mastermind! Pick out four colors and guess what the secret code is!"
  end

  def game_over
    
  end
  
end

test = GameController.new
test.play