require 'pry'

class Game

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

	def greeting
	puts "It's TicTacToe.  Figure it out!"
	end


  def player_turn
    @board.show_board
    mark = @current_player.player
    guess = @current_player.take_turn
    available_moves = @board.available_moves
    until available_moves.include?(guess)
      puts "#Sorry, {guess} is not a valid option. Please choose one of the numbers still on the board: "
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
    response = @current_player.feedback
    until response == "N" 
      play
      response = feedback
    end 
  end

end