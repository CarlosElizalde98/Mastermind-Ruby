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
    puts @correct_guesses.keys.sort
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
    reset_correct_guesses
    correct_guesses = secret_code.slice(0..-1)
    find_red_guesses(guesses, correct_guesses)
  end

  def find_red_guesses(guesses, secret_code)
    secret_code.each_with_index { |guess, index|
      if guess == guesses[index]
        @correct_guesses[index] = "Red"
        secret_code[index] = "Done"
      end
      binding.pry
  }
    if secret_code.any? {|value| guesses.include?(value)}
        find_white_guesses(guesses, secret_code)
    end 
  end

  def find_white_guesses(guesses, secret_code)
    secret_code.each_with_index { |correct, index|
      guesses.length.times do |num|
        if correct == guesses[num] && index != num
          @correct_guesses[index] = "White"
          secret_code[index] = "Done"
        
        end
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

