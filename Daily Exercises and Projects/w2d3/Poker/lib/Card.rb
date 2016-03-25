require "colorize"

# h = "♡".colorize(:red)
# h2 = "♥".colorize(:red)
#
# #puts "4\n#{h}"
#
# p "♡".colorize(:red) == "♡".colorize(:red)

class Card
  UNICODE = {"heart" => "♡".colorize(:red), "spade" => "♤".colorize(:white),
            "diamond" => "♢".colorize(:red), "club" => "♧".colorize(:white)}

  FACE = { 11 => "J", 12 => "Q", 13 => "K", 14 => "A" }

  #@suit = UNICODE[suit.downcase]

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def display
    puts "#{UNICODE[suit]} #{value > 10 ? FACE[value] : value} #{UNICODE[suit]}"
  end
end
