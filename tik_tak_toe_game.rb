require_relative 'tik_tak_toe_board'

@player1 = 1
@player2 = 2 
@current_player = @player1
@game_board = TikTakToeBoard.new
movement = [0,0]

private
def reset_game
  @current_player = @player1
  @game_board.reset_board
  @moves = 0;
end

def move_valid?(movement)
  @game_board.board[movement[0]][movement[1]] == 0 ? true : false   
end

def select_space(movement,player)
  movement = movement.split(",")
  if(is_integer?(movement[0]) && is_integer?(movement[1]))
    movement[0] = movement[0].to_i
    movement[1] = movement[1].to_i
  else
    raise StandardError.new "Invalid Move"
  end 

  if move_valid?(movement)
    @game_board.move(player, movement)
    @moves += 1 
    @current_player = @current_player == @player1 ? @player2 : @player1
  else
    puts "Move invalid, try again"
  end
end

def win?(player)
  if @game_board.board[0][0] == player && @game_board.board[1][1] == player && @game_board.board[2][2] == player
    return true
  elsif @game_board.board[0][0] == player && @game_board.board[1][1] == player && @game_board.board[2][2] == player
    return true
  elsif @game_board.board[0][2] == player && @game_board.board[1][1] == player && @game_board.board[2][0] == player
    return true
  elsif @game_board.board[0][0] == player && @game_board.board[0][1] == player && @game_board.board[0][2] == player
    return true
  elsif @game_board.board[1][0] == player && @game_board.board[1][1] == player && @game_board.board[1][2] == player
    return true
  elsif @game_board.board[2][0] == player && @game_board.board[2][1] == player && @game_board.board[2][2] == player
    return true
  elsif @game_board.board[0][0] == player && @game_board.board[1][0] == player && @game_board.board[2][0] == player
    return true
  elsif @game_board.board[0][1] == player && @game_board.board[1][1] == player && @game_board.board[2][1] == player
    return true
  elsif @game_board.board[0][2] == player && @game_board.board[1][2] == player && @game_board.board[2][2] == player
    return true
  else 
    return false
  end
end

def is_integer?(word)
  word.to_i.to_s == word
end
#Gameplay loop
while(true)
  print @current_player == @player1 ? "Player 1: " : "Player 2: "
  begin
    input = gets.chomp
    select_space(input, @current_player)
  rescue
    puts "invalid input"
  end

  if win?(@player1)
    puts "Player 1 has won the game"
    reset_game
  elsif win?(@player2)
    puts "Player 2 has won the game"
    reset_game
  elsif @moves == 9
    puts "Tie"
  end
end
