require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player, :hit
  
  def initialize(player = HumanPlayer.new("Reed"), board = Board.random_grid)
    @player = player
    @board = board
    @hit = nil
  end
  
  def attack(pos)
    board[pos] == :s ? @hit = true : @hit = false
    board[pos] = :x
  end
  
  def count
    @board.count
  end
  
  def game_over?
    @board.won?
  end
  
  def play_turn
    board.display
    print hit? ? "Hit! " : "Miss. " unless @hit == nil
    puts "#{board.count} ships left."
    @hit = false
    
    pos = nil
    until board.valid_play?(pos)
      pos = player.get_play
    end
    attack(pos)
    system("clear")
  end
  
  def hit?
    @hit
  end
  
  def play
    puts "Battleship!"
    until game_over?
      play_turn
    end
    puts "Game over!"
  end
  
end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end