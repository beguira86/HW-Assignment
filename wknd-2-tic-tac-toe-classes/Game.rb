require 'pry'

class Game

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

	def greeting
	puts "It's TicTacToe.  You pick numbers and then your opponent does.  Simple enough?"
	end


  def take_turn
    @board.show_board
    mark = @current_player.player
    puts "\nWhere do you want to move? "
    guess = gets.chomp.to_i
    available_moves = @board.available_moves
    until available_moves.include?(guess)
      puts "#\n{guess} is already taken dummy, try again! "
      guess = gets.chomp.to_i
    end
    @board.update_board(guess, mark)
  end

  def switch_player
    until @board.game_over?
      player_turn
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  end

  def end_game
    @board.show_board
    if @board.win? 
      puts "Player #{@current_player.player} wins!"
    else
      puts "Failures, the lot of you!"
    end
  end

  def play
    greeting
    switch_player
    end_game
    play_again?
  end

  def play_again?
    choice = gets.chomp.downcase
    until choice == "no"
      play
    end 
  end

end