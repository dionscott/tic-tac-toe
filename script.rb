#tic-tac#toe game
#class can be players and boards
#players can mark the board with x or o
#players keep their score

#shows the board and keeps track of players marking
class Board
  def initialize
    create_board
  end
  #board creates a new game
  def create_board
    #create three rows with arrays to mark
    @board = Array(1..9)
  end

  #shows the board
  def show_board
    p @board[0..2]
    p @board[3..5]
    p @board[6..8]
  end

  #change the board based on player
  def mark_board(position, character)
    #find the position or return nil
    index = @board.index(position)
    #check if the position has been taken
    if index
      @board[index] = character
    else
      p "This spot is not avaliable. Choose again."
      show_board
    end
  end

  #checks if the game is won
  def is_won?
    #check if any of the thingies match
  end
end

board = Board.new
board.show_board
board.mark_board(3,"x")
board.show_board
board.mark_board(3,"x")
