# frozen_string_literal: true

# tic-tac-toe game
# class can be players and boards
# players can mark the board with x or o
# players keep their score

# shows the board and keeps track of players marking
class Board
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
  def mark_board(position, character)
    # find the position or return nil
    index = @board.index(position)
    # check if the position has been taken
    if index
      @board[index] = character
      show_board
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

  def win_condition
    win_conditions = [] << [@board[0], @board[1], @board[2]]
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
  def initialize(x_or_o)
    if x_or_o == "x"
      @mark = "X"
      @turn = true
    else
      @mark = "O"
      @turn = false
    end
  end

  def mark
    @mark
  end

  def turn
    @turn
  end

  def change_turn
    !@turn
  end


  def play(position)
  end
end

def play_game
  # generate the board and initialize player 1 and 2
  board = Board.new
  board.show_board
  player_1 = Player.new("x")
  player_2 = Player.new("o")

  # continue game until won
end

board = Board.new
  board.show_board
  player_1 = Player.new("x")
  player_2 = Player.new("o")
  board.mark_board(1, "x")
  board.mark_board(5, "x")
  board.mark_board(6, "x")
  board.mark_board(9, "x")
  p board.won?
