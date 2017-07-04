require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new("Tester"), board = Board.random)
    @player = player
    @board = board
    @hit = false
  end

  def attack(pos)
    if board[pos] == :s
      @hit = true
    else
      @hit = false
    end

    board[pos] = :x
  end

  def count
    board.count
  end

  def display
    board.display
    puts "You sunk a ship!" if hit?
    puts "There are #{count} ships remaining."
  end

  def game_over?
    board.won?
  end

  def hit?
    @hit
  end

  def valid_play?(pos)
    pos.is_a?(Array) && board.in_range?(pos)
  end

  def play_turn
    pos = nil

    until valid_play?(pos)
      display
      pos = player.get_play
    end

    attack(pos)
  end

  def play
    play_turn until game_over?

    puts "Congrats! You've sunk all the ships!"
  end
end

if $0 == __FILE__
  BattleshipGame.new.play
end
