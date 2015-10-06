require 'pry'

class Player

  def initialize
    puts "Pick a side, X or O? "
    choice = gets.chomp.upcase
    until ["X", "O"].include?(choice)
      puts "Let's try again.  X or O. "
      choice = gets.chomp.upcase
    end
    @player = choice
  end

  def player
    @player
  end

  def playagain
    puts "Would you like to play again?"
    gets.chomp.downcase
  end

end




