class Hangman
  attr_reader :guesser, :referee, :board, :turns_remaining, :misses
  
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @misses_remaining = 8
    @misses = []
  end
  
  def setup
    @board = Array.new(referee.pick_secret_word)
    @guesser.register_secret_length(board.length)
    display_board
  end
  
  def play
    setup
    until game_over?
      take_turn
    end
    display_winner
  end
  
  def take_turn
    print "Guess: "
    guess = @guesser.guess(@board)
    puts guess if @guesser.is_a?(ComputerPlayer)
    correct_positions = @referee.check_guess(guess)
    update_board(guess, correct_positions)
    @guesser.handle_response(guess, correct_positions)
    print "\n"
    display_board
  end
  
  def update_board(guess, correct_positions)
    correct_positions.each { |pos| @board[pos] = guess }
    @misses << guess if correct_positions.empty?
    @misses_remaining -= 1 if correct_positions.empty?
  end
  
  def display_board
    puts "Word: #{@board.collect {|el| el.nil? ? "_" : el}.join(" ")}"
    puts "      #{(1..@board.count).collect {|x| ((x-1+10)%10) }.join(" ")}"
    puts "Misses: #{@misses.join(",")}"
    puts "Misses remaining = #{@misses_remaining}"
  end
  
  def game_over?
    !@board.include?(nil) || @misses_remaining == 0
  end
  
  def display_winner
    print "\n"
    if @misses_remaining > 0
      print "The guesser ("
      print @guesser.is_a?(ComputerPlayer) ? "The Computer" : @guesser.name
      puts ") is the winner!"
    else
      print "The referee ("
      print @referee.is_a?(ComputerPlayer) ? "The Computer" : @referee.name
      puts ") is the winner!"
    end
    nil
  end
  
end

class HumanPlayer
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def register_secret_length(board_length)
    puts "The secret word is #{board_length} letters long.\n\n"
  end
  
  def guess(board)
    gets.chomp
  end
  
  def handle_response(guess, correct_positions)
    nil
  end
  
  def pick_secret_word
    print "What is the length of your secret word, #{@name}: "
    Integer(gets.chomp)
  end
  
  def check_guess(guess)
    correct_positions = []
    print "Which letters (starting at index 0) are in the secret word (press enter for none): "
    input = gets.chomp
    correct_positions = input.split(" ").collect { |el| Integer(el) } if !input.empty?
    correct_positions
  end
  
  #def handle_response(guess, correct_positions)
  #  print "Which letters of the secret word are a \'#{guess}\'? Enter '0' for none: "
  #end
  
end

class ComputerPlayer
  attr_reader :dictionary, :secret_word, :candidate_words
  
  def initialize(dictionary = full_dictionary)
    @dictionary = dictionary
    @candidate_words = dictionary
    @secret_word = ""
  end
  
  def full_dictionary
    dictionary = []
    begin
      File.open("dictionary.txt", "r") do |f|
        f.each_line do |word|
          dictionary << word.chomp
        end
      end
    rescue
      File.open("lib/dictionary.txt", "r") do |f|
        f.each_line do |word|
          dictionary << word.chomp
        end
      end
    end
    dictionary
  end
  
  def pick_secret_word
    @secret_word = dictionary[rand(dictionary.count)]
    secret_word.length
  end
  
  def check_guess(guess)
    letters = secret_word.split("")
    correct_positions = []
    letters.each_with_index { |letter, idx| correct_positions << idx if letter == guess }
    correct_positions
  end
  
  def register_secret_length(length)
    @candidate_words = dictionary.select { |word| word.length == length }
  end
  
  def guess(board)
    word_counter = Hash.new(0)

    @candidate_words.each do |word|
      board.each_with_index do |letter, pos|
        word_counter[word[pos]] += 1 if letter.nil?
      end
    end
    word_counter.key(word_counter.values.sort.last)
  end
  
  def handle_response(guess, correct_positions)
    
    if correct_positions.count == 0
      @candidate_words.select! do |word|
        !word.include?(guess)
      end
    else
      @candidate_words.select! do |word|
        delete = false
        word.split("").each_with_index do |letter,idx|
          delete = true if letter != guess && correct_positions.include?(idx)
          delete = true if letter == guess && !correct_positions.include?(idx)
        end
        !delete
      end
    end
    nil
  end
  
end

# Players
reed = HumanPlayer.new("Reed")
justin = HumanPlayer.new("Justin")
computer1 = ComputerPlayer.new
computer2 = ComputerPlayer.new

# PvP:1 (Reed is guesser)
players1 = {
  guesser: reed,
  referee: justin
}

# PvP:2 (Justin is guesser)
players2 = {
  guesser: justin,
  referee: reed
}

# PvC:3 (Reed is guesser)
players3 = {
  guesser: reed,
  referee: computer1
}

# CvP:4 (Computer is guesser)
players4 = {
  guesser: computer1,
  referee: reed
}

# CvC:5 (Computer is guesser and referee)
players5 = {
  guesser: computer1,
  referee: computer2
}

#game1 = Hangman.new(players1).play
#game2 = Hangman.new(players2).play
#game3 = Hangman.new(players3).play
#game4 = Hangman.new(players4).play
#game5 = Hangman.new(players5).play

#if __FILE__ == $PROGRAM_NAME
  #
#end