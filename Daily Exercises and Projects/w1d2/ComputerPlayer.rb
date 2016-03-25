require_relative 'Board.rb'
require_relative 'Game.rb'

class ComputerPlayer

  attr_reader :known_cards

  def initialize(game)
    @game = game
    #@board = game.board
    @known_cards = {}
  end

  def get_pos(previous_guess, prev_guessed_pos)
    #pos = nil
    puts "known cards: #{@known_cards}"
    if previous_guess.nil?
      @known_cards.each do |key, val|
        @known_cards.each do |key2, val2|
          if val == val2 && key != key2
            p "HI"
            pos = key2
          end
        end
      end
    else

      @known_cards.each do |key, val|
        @known_cards.each do |key2, val2|
          if val == val2 && key != key2
            p "HI2"
            pos = key
          end
        end
      end


    #   @known_cards.each do |key, val|
    #     if @known_cards.values.count(val) == 2 && key != prev_guessed_pos
    #       puts "key: #{key} prev guess: #{prev_guessed_pos}"
    #       pos =  key
    #     end
    #   end
    end

    puts "posit. #{pos}"
    pos ||= [rand(0...@game.board.grid.count).to_s, rand(0...@game.board.grid.count).to_s]
    pos.map!(&:to_i)
    @known_cards[pos] = @game.board[pos].value
    pos.map!(&:to_s)
    return pos
  end

end
