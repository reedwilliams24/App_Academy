#require "Hand.rb"
require 'byebug'
class Player

  attr_reader :name
  attr_accessor :hand, :balance

  def initialize(name, hand, balance)
    @name, @hand, @balance = name, hand, balance
  end

  def discard(card_pos)
    resulting_hand = []
    #byebug
    @hand.each_index {|i| resulting_hand << @hand[i] unless card_pos.include?(i)}
    @hand = resulting_hand
  end

  def fold
    @hand = []
  end

  def see(amount)
    @balance -= amount
  end

  def raise(amount)
    @balance -= amount
  end
end
