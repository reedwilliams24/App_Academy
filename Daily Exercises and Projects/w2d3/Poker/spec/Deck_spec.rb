require "Deck.rb"

describe "Deck" do
  let(:deck) {Deck.new}

  describe "#initialize" do
    it "fills the card with 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "has 13 hearts" do
      expect(deck.cards.count{|card| card.suit == "heart"}).to eq(13)
    end

    it "has 13 spades" do
      expect(deck.cards.count{|card| card.suit == "spade"}).to eq(13)
    end

    it "has 13 diamonds" do
      expect(deck.cards.count{|card| card.suit == "diamond"}).to eq(13)
    end

    it "has 13 clubs" do
      expect(deck.cards.count{|card| card.suit == "club"}).to eq(13)
    end

  end
end
