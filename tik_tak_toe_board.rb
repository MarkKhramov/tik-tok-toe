require_relative 'game_board' 
class TikTakToeBoard < GameBoard
  attr_reader :board

  def initialize
    @board = [0,0,0],
             [0,0,0],
             [0,0,0]
  end
  
  def move(player_number, space)
    @board[space[0]][space[1]] = player_number 
    view_board
  end 

  def view_board
    draw_board(@board, '-','X','O')
  end

  def reset_board
    @board = [0,0,0],
             [0,0,0],
             [0,0,0]
  end
end

