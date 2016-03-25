require "player.rb"
require "hand.rb"

describe "Player" do
  let(:player1) {Player.new("player1", Hand.new, 100)}
  # double (:hand, {:discard => 10})

  describe "#initialize" do
    it "takes a name" do
      expect(player1.name).to eq("player1")
    end

    it "takes a hand" do
      expect(player1.hand.class).to be(Hand)
    end

    it "tracks a player balance" do
      expect(player1.balance).to eq(100)
    end
  end

  describe "#discard" do
    # double :hand
    # allow(hand).to receive(:discard)
    let(:player2) {Player.new("player2", Hand.new, 100)}

    it "discards at most 3 cards from hand" do
      # expect(player2.hand).to receive(:discard)
      player2.discard([0, 1, 2])
      expect(player2.hand.count).to eq(2)
    end
  end

  describe "#fold" do
    it "does not change the Player's balance" do
      player1.fold
      expect(player1.balance).to eq(100)
    end

    it "discards all cards from Player's hand" do
      player1.fold
      expect(player1.hand).to eq([])
    end
  end

  describe "#see" do
    it "removes the highest bid amount from players balance" do
      current_bet = 45
      player1.see(current_bet)
      expect(player1.balance).to eq(55)
    end
  end

  describe "#raise" do
    it "removes the raise amount from players balance" do
      raise_amount = 45
      player1.raise(raise_amount)
      expect(player1.balance).to eq(55)
    end
  end

end
