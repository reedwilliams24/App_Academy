require "Card.rb"

describe "Card" do

  let(:new_card) {Card.new(2, "heart")}

  describe "#initialize" do
    it "takes a card suit" do
      expect(new_card.suit).to eq("heart")
    end

    it "takes a card value" do
      expect(new_card.value).to eq(2)
    end

  end

end
