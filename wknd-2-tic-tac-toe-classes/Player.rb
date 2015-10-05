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

  def feedback
    puts "\nWould you like to play again? 'Y'es or 'N'o."
    gets.chomp.upcase
  end

  def take_turn
    puts "Where do you want to move? "
    move = gets.chomp.to_i
    move
  end

end




