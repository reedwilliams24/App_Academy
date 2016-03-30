# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
    #@cards = deck.take(8)
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    suit_count = Hash.new(0)

    @cards.each do |card|
      suit_count[card.suit] += 1
    end

    favorite = nil
    favorite_count = 0

    suit_count.each do |suit, count|
      if count > favorite_count
        favorite = suit
        favorite_count = count
      end
    end

    favorite
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise "cannot play card outside your hand" unless @cards.include?(card)
    if card.value ==:eight
      pile.play_eight(card, favorite_suit)
    else
      pile.play(card)
    end
    @cards.delete(card)
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards.concat(deck.take(1))
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    @cards.each do |card|
      return card if pile.valid_play?(card) && card.value != :eight
    end

    @cards.each do |card|
      return card if pile.valid_play?(card)
    end

    nil
  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  def play_turn(pile, deck)
    choosen_card = choose_card(pile)
    play_card(pile, choosen_card) unless choosen_card.nil?

    until choosen_card
      break if deck.empty?
      draw_from(deck)
      choosen_card = choose_card(pile)
      play_card(pile, choosen_card) unless choosen_card.nil?
    end
    nil
  end
end
