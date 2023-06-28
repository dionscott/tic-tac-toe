# frozen_string_literal: true

# tic-tac-toe game
# class can be players and boards
# players can mark the board with x or o
# players keep their score

# shows the board and keeps track of players marking
class Board
  # Initialize by creating a board and setting game_won to false
  def initialize
    create_board
    @game_won = false
  end

  def game_won
    @game_won
  end

  # board creates a new game
  def create_board
    # create an array with numbers 1 to 9
    @board = Array(1..9)
  end

  # shows the board
  def show_board
    p @board[0..2]
    p @board[3..5]
    p @board[6..8]
  end

  # mark the board based on player mark
  def mark_board(position, player)
    index = @board.index(position)
    @board[index] = player.mark
    show_board
  end

  #check if the position has been taken by another player
  def valid_position?(position)
    index = @board.index(position)
    if index
      true
    else
      false
    end
  end

  # checks if the game is won
  def won?
    # check if there are any matches on the board
    win_conditions = win_condition
    # if any of these all match each each other
    if win_conditions.any? { |condition| condition.uniq.size <= 1 }
      @game_won = true
    end
  end

  # All avaliable win conditions
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
      @name = "Player 1"
    else
      @mark = "O"
      @turn = false
      @name = "Player 2"
    end
  end

  # Shows the mark of the player
  def mark
    @mark
  end

  def name
    @name
  end

  # Returns true or false depending on whose turn
  def turn
    @turn
  end

  # Change the turn
  def change_turn
    @turn = !@turn
  end
end

def play_game
  # generate the board and initialize player 1 and 2
  board = Board.new
  board.show_board
  player_1 = Player.new("X")
  player_2 = Player.new("O")

  # swap player 1 and player 2 turns
  def swap_turns(p1 = player_1, p2 = player_2)
    p1.turn = p1.change_turn
    p2.turn = p2.change_turn
  end
  # create game function
  until board.game_won
    p "Enter the position you would like to play."
    position = gets.chomp.to_i

    if board.valid_position?(position)
      if player_1.turn
        p player_1.turn
        board.mark_board(position, player_1)
      else
        board.mark_board(position, player_2)
      end
        # change player turn
        # start again from player 2
        # check until game is won
        player_1.change_turn
        player_2.change_turn
        board.won?
    else
      p "Invalid position. Try again"
    end
  end
  # player 1 chooses a spot
  # check if that spot is avaliable
  # if it is place the mark
  # if it isn't restart and try to place mark again
  p "The player won the game"
  # continue game until won
end

play_game
