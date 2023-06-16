# frozen_string_literal: true

# tic-tac-toe game
# class can be players and boards
# players can mark the board with x or o
# players keep their score

# shows the board and keeps track of players marking
class Board
  # Initialize by creating a board
  def initialize
    create_board
  end

  # board creates a new game
  def create_board
    # create three rows with arrays to mark
    @board = Array(1..9)
  end

  # shows the board
  def show_board
    p @board[0..2]
    p @board[3..5]
    p @board[6..8]
  end

  # change the board based on player
  def mark_board(position, player)
    # find the position or return nil
    index = @board.index(position)
    # check if the position has been taken
    if index
      @board[index] = player.mark
      if won?
        p "Congratulations Player #{player.mark} has won!"
        show_board
      else
        player.change_turn
        p "Next Player"
        show_board
      end
    else
      p "This spot is not avaliable. Choose again."
      show_board
    end
  end

  # checks if the game is won
  def won?
    # check if there are any matches on the board
    win_conditions = win_condition
    # if any of these all match each each other
    if win_conditions.any? { |condition| condition.uniq.size <= 1 }
      true
    else 
      false
    end
  end

  # This might be able to be a constant
  def win_condition
    win_conditions = [] 
    win_conditions << [@board[0], @board[1], @board[2]]
    win_conditions << [@board[3], @board[4], @board[5]]
    win_conditions << [@board[6], @board[7], @board[8]]
    win_conditions << [@board[0], @board[3], @board[6]]
    win_conditions << [@board[1], @board[4], @board[7]]
    win_conditions << [@board[2], @board[5], @board[8]]
    win_conditions << [@board[0], @board[4], @board[8]]
    win_conditions << [@board[2], @board[4], @board[6]]
    win_conditions
  end

end

class Player
  # initialize player with x or o
  def initialize(x_or_o)
    if x_or_o == "X"
      @mark = "X"
      @turn = true
    else
      @mark = "O"
      @turn = false
    end
  end

  # Shows the mark of the player
  def mark
    @mark
  end

  # Returns true or false depending on whose turn
  def turn
    @turn
  end

  # Change the turn
  def change_turn
    !@turn
  end
end

def play_game
  # generate the board and initialize player 1 and 2
  board = Board.new
  board.show_board
  player_1 = Player.new("X")
  player_2 = Player.new("O")

  # continue game until won
end

board = Board.new
  board.show_board
  player_1 = Player.new("X")
  player_2 = Player.new("O")
  board.mark_board(1, player_1)
  board.mark_board(5, player_1)
  board.mark_board(6, player_1)
  board.mark_board(6, player_1)
  board.mark_board(1, player_1)
  board.mark_board(4, player_2)
  p board.won?
