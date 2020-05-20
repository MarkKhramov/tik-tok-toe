class GameBoard 
  #Draws a 2d board using the symbol provided in symbol_empty as the item drawn at zero, symbol_p1 as the item drawn at one, and symbol_p2 as the item drawn at 2
  private
  def draw_board(board, symbol_empty, symbol_p1, symbol_p2)
    puts "";
    board.each do |line|
      line.each do |character|
        if character == 0; 
          print symbol_empty
        else
          print character == 1 ? symbol_p1 : symbol_p2
        end
        print " "
      end
      puts ""
    end
    puts "";
  end
end
