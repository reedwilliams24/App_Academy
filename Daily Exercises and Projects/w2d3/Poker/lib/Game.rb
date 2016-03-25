require_relative 'Card.rb'
require_relative 'Player.rb'
require_relative 'Hand.rb'
require_relative 'Deck.rb'

class Game

  attr_accessor :deck, :pot, :current_player

  def initialize(deck = Deck.new)
    @pot = 0
    @deck = deck
    @player1 = Player.new("Reed", [], 100)
    @player2 = Player.new("Walid", [], 100)
    @current_player = @player1
    initial_deal
  end

  def initial_deal
    card_amount = 5
    card_amount.times do
      @player1.hand << @deck.pop
    end

    card_amount.times do
      @player2.hand << @deck.pop
    end
  end

  def deal(number_of_cards)
    number_of_cards.times do
      @current_player.hand << @deck.pop
    end
  end

  def run
    until game_over?
      play_turn
      switch_players
      play_turn
      winning_player = @player1 #stronger_hand(@player1, @player2)
      winning_player.balance += pot
      @player1.fold
      @player2.fold
      @pot = 0
      @deck = Deck.new
      initial_deal
    end
    puts "Winner is #{@player1.name} with $#{@player1.balance} million!!!"
  end

  def switch_players
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def play_turn
    render
    puts "What is your initial bid (in $ millions):"
    initial_bid = gets.chomp.to_i
    @current_player.balance -= initial_bid
    @pot += initial_bid
    render

    puts "Which cards do you want to discard?"
    discarded_cards = gets.chomp.split(' ').map(&:to_i)
    @current_player.discard(discarded_cards)
    deal(discarded_cards.length)
    render

    puts "Do you want to fold, see, or raise (by 10)?"
    move = gets.chomp
    action(move)
  end

  def action(move)
    highest_bid = [100 - @player1.balance, 100 - @player2.balance].max
    case move
    when "fold"
      @current_player.fold
    when "see"
      @current_player.see(highest_bid - 100 - @current_player.balance)
      @pot += 10
    when "raise"
      @current_player.raise(10)
    else
      @current_player.fold
    end
  end

  def render
    system 'clear'
    puts "#{current_player.name} has $#{current_player.balance} million"
    puts "The pot is: $#{pot} million"
    @current_player.hand.each do |card|
      card.display
    end
  end

  def game_over?
    @player1.balance == 0 || @player2.balance == 0
  end

end

g = Game.new
g.run
