require_relative 'player'
require 'byebug'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until @hand.points >= 17
      @hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    if @bets[player].nil?
      @bets[player] = amt
    else
      @bets[player] += amt
    end
  end

  def pay_bets
    @bets.each do |player, bet|
      player.pay_winnings(bet)
    end
  end
end
