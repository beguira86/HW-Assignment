require "pry"
require "./human"
require "./random"
require "./counting"
require "./smarty"

class GuessingGame
  def initialize(type)
    @player = type
  end



  def play
    
    number = rand(1..100)
    help = 0
    last_guess = 50
    count = 1
    guess = @player.get_guess(help, last_guess)
    until guess == number
      if guess > number
        puts "Too High!"
        help = "High"
      else guess < number
        puts "Too Low!"
        help = "Low"
      end
      last_guess = guess
      guess = @player.get_guess(help, last_guess)
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end



puts "What type of guessing should we use: human, counting, guesser or smartypants?"
puts "\nCheck your spelling!!!"
choice = gets.chomp.downcase
if choice == "human"
  type = HumanPlayer
elsif choice == "counting"
  type = CountingPlayer
elsif choice == "random"
  type = RandomPlayer
else
  type = Smartypants
end

game = GuessingGame.new(type.new)
game.play


##### Break function?