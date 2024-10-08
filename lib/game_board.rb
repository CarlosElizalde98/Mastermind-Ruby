require 'pry-byebug'
require_relative 'code_master'
require_relative 'code_breaker'

class GameBoard
  attr_reader :correct_guesses
  def initialize(player, player_two)
    @player_one = player
    @player_two = player_two
    @correct_guesses = {}
    @spaces = []
    @guesses = []
  end

  def print_board
    @guesses.each {|guess|
      puts "|#{guess}|"
    }
    @correct_guesses.each do |key, value|
      puts "#{key + 1}: #{value}"
    end
  end

  def check_board(guesses)
    @guesses.concat(guesses)
    correct = @player_two.secret_code
    guess_calculator(@guesses, correct)
    print_board
    reset_guesses
  end

  def guess_calculator(guesses, secret_code)
    guesses.each_with_index { |guess, index|
        if guess == secret_code[index]
          @correct_guesses[index] = "Red"
        elsif guess != secret_code[index]
          secret_code.length.times do |num|
            if guess == secret_code[num] && index != num
              @correct_guesses[index] = "White"
            end
          end
        else
          @correct_guesses[index] = ' '
        end
      }
  end

  def reset_correct_guesses
    @correct_guesses = {}
  end

  def reset_guesses
    @guesses = []
  end

end

