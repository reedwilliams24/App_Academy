require 'set'
class WordChainer
  attr_reader :move_history, :solution_path
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set
    @move_history = Hash.new
    @solution_path = []
  end


  def find_solution(source, target)
    queue = [source]
    adjacent_words_check = []
    count = 0
    until queue.empty? || @move_history.keys.include?(target)
      adjacent_words_check << queue.pop until queue.empty?
      adjacent_words_check.each do |word|
        adjacent_words(word).each { |word2| queue << word2 }
      end
      #p queue
      count += 1
    end
    # @move_history
    # p @move_history.keys.include?(target)
    find_solution_path(source, target)
  end

  def find_solution_path(source, target)
    word = target
    @solution_path << word
    until word == source
      @solution_path << @move_history[word]
      word = @move_history[word]
    end
    #@solution_path << @move_history[word]
    @soultion_path
  end

  def adjacent_words(word)
    adjacent_words = []
    @dictionary.each do |potential_adj_word|
      if potential_adj_word.length == word.length && letter_difference(word, potential_adj_word) == 1
        adjacent_words << potential_adj_word
      end
    end
    add_to_move_history(word, adjacent_words)
    adjacent_words
  end

  def add_to_move_history(parent, children)
    children.each do |child|
      unless @move_history.values.include?(child) || @move_history.keys.include?(child)
        @move_history[child] = parent
      end
    end
  end


  def letter_difference(word,target)
    count = 0
    word.split("").each_with_index do |char, index|
      count += 1 unless char == target[index]
    end
    count
  end
end
p start_time = Time.now
chainer = WordChainer.new("dictionary.txt")
chainer.find_solution("duck","ruby")
p end_time = Time.now
p (end_time - start_time)/1000
p chainer.solution_path
