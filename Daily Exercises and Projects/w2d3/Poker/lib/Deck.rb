require_relative "Card.rb"

class Deck
  attr_accessor :cards

  def initialize
    @cards = populate
    self.shuffle
  end

  def populate
    new_cards = []
    suits = ["heart", "spade", "club", "diamond"]
    (2..14).each do |value|
      suits.each do |suit|
        new_cards << Card.new(value, suit)
      end
    end
    new_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def pop
    @cards.pop
  end

end
