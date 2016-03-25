class Hand
  require_relative "card"
  require 'byebug'
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    # cards = []
    # while deck.count > 0 && deck.count <= 2
    #   cards << deck.shift
    # end
    Hand.new(deck)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    value = 0
    ace_count = 0
    @cards.each do |card|
      if card.suit == :ace
        ace_count += 1
      end
      value += card.blackjack_value
    end
    if (value + (ace_count*11)) == 21
      value = 21
    end
    value
  end

  def busted?
    true if points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
  end

  def beats?(other_hand)
    other_hand.points <=> @self.points

  end

  def return_cards(deck)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
