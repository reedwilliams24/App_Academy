class Game
  def initialize(player1, player2, dictionary = set_dictionary)
    @current_player = player1
    @previous_player = player2
    @dictionary = dictionary
    @fragment = ""
    @losses = {player1 => 0, player2 => 0}
  end

  attr_accessor :current_player, :previous_player, :fragment, :losses
  attr_reader :dictionary

  def switch_player!
    current_player, previous_player = previous_player, current_player
  end

  def take_turn(player)
    letter = player.get_move
    until valid_move?(letter)
      puts "Invalid move."
      letter = player.get_move
    end
    fragment << letter
    dictionary.select! { |word| word[0...fragment.length] == fragment }
  end

  def play_round
    until losses.values.include?(5)
      until over?
        take_turn(current_player)
        switch_player!
      end
      losses[current_player] += 1
      set_dictionary
      display_score
    end
    puts "#{current_player.name} lost! :'("
  end

  def valid_move?(str)
    str.length == 1 && dictionary.any? {|word| word[0..fragment.length] == (fragment + str)}
  end

  def set_dictionary
    dictionary = File.readlines("dictionary.txt")
    dictionary.map! {|word| word.chomp}
  end

  def display_score
    losses.keys.each do |jugador|
      puts "#{jugador.name}: #{ghost_letters(jugador)}"
    end
  end

  def ghost_letters(jugador)
    "GHOST"[0,losses[jugador]]
  end

  def over?
    dictionary.include?(fragment) || dictionary.empty?
  end
end

class Player
  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def get_move
    puts "Enter a letter: "
    gets.chomp
  end

end
