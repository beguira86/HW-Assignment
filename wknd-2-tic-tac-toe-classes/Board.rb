require 'pry'

WIN_SET = [[0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

class Board

  def initialize
    @board = (1..9).to_a
  end

  def board
    @board
  end

  def show_board
    board = @board
    puts "
     #{board[0]} | #{board[1]} | #{board[2]}
     #{board[3]} | #{board[4]} | #{board[5]}
     #{board[6]} | #{board[7]} | #{board[8]} 
     "
  end

  def update_board(move, mark)
    @board[move - 1] = mark
  end

  def available_moves
    @board.reject { |x| x.is_a? String }
  end

  def win?   #  if the board locations matching an X are in the same board positions as winset.any?
  WIN_SET.any? { |a, b, c| board[a] == board[b] && board[b] == board[c]}
    end
  end

  def draw?
    @board.all? { |x| x.is_a?(String)}
  end

  def game_over?
    win? || draw?
  end  
