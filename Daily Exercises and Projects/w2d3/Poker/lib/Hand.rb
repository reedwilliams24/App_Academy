class Hand

  attr_accessor :cards
  def initialize
    @cards = Array.new(5) {Card.new(5, "heart")}
  end
end
