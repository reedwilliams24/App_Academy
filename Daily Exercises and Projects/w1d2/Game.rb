require_relative 'Board.rb'
require_relative 'Card.rb'
require_relative 'HumanPlayer.rb'
require_relative 'ComputerPlayer.rb'

class Game
  attr_reader :board, :prev_guessed_pos, :previous_guess

  def initialize(player=false, board=Board.new)

    @board = board

    player ? @player = HumanPlayer.new("Joe") : @player = ComputerPlayer.new(self)

  end

  def play
    setup

    until @board.won?
      play_round
    end

    puts "You win!"
  end

  def setup
    @board.populate
    @board.render
  end

  def play_round
    @previous_guess = nil
    @prev_guessed_pos = take_turn
    @previous_guess = @board.grid[@prev_guessed_pos[0]][@prev_guessed_pos[1]]
    @board.reveal(@prev_guessed_pos)
    @board.render

    guessed_pos = take_turn
    @board.reveal(guessed_pos)
    @board.render
    # sleep(3)

    if !match?(guessed_pos)
      @board.hide(@prev_guessed_pos)
      @board.hide(guessed_pos)
      @board.render
    else
      if @player.is_a? ComputerPlayer
        @player.known_cards.delete_if { |_, value| value == @previous_guess.value }
      end
    end

  end

  def get_pos
    @player.get_pos(@previous_guess, @prev_guessed_pos)
  end

  def take_turn
    guessed_pos = get_pos
    until valid_play?(guessed_pos)
      p "Guess was not valid!"
      p guessed_pos = get_pos
    end
    guessed_pos.map!(&:to_i)

    guessed_pos
  end

  def match?(guessed_pos)
    row = guessed_pos[0]
    col = guessed_pos[1]

    @board.grid[row][col] == @previous_guess
  end

  def valid_play?(guessed_pos)
    row = guessed_pos[0]
    col = guessed_pos[1]
    length = @board.grid.count
    guess_range = (0..length).map(&:to_s)

    return false if (!guess_range.include?(row) || !guess_range.include?(col))

    if row.to_i >= length || col.to_i >= length
      return false
    elsif row.to_i < 0 || col.to_i < 0
      return false
    end

    #If card is already revealed return false, else return true.
    !(@board.grid[row.to_i][col.to_i].face_up)
  end

end

if __FILE__ == $PROGRAM_NAME
  g = Game.new(false)
  g.play
end
