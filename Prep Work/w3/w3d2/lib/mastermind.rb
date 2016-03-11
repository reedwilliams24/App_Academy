class Code
  attr_reader :pegs
  
  PEGS = {
    "B" => :blue,
    "G" => :green,
    "O" => :orange,
    "P" => :purple,
    "R" => :red,
    "Y" => :yellow
  }
  
  def initialize(pegs)
    @pegs = pegs
  end
  
  def self.parse(input)
    result = []
    
    input.length.times do |idx|
      raise_error "Invalid input" unless PEGS.has_key?(input.upcase[idx])
      result << PEGS[input.upcase[idx]]
    end
    
    Code.new(result)
  end
  
  def self.random
    pegs = []
    4.times do 
      pegs << PEGS.values.sample
    end
    Code.new(pegs)
  end
  
  def [](idx)
    pegs[idx]
  end
  
  def exact_matches(code)
    result = 0
    4.times do |peg|
      result += 1 if self[peg] == code[peg]
    end
    result
  end
  
  def near_matches(code)
    
    self_colors = Hash.new(0)
    other_colors = Hash.new(0)
    near_match_count = 0
    
    self.pegs.each do |color|
      self_colors[color] += 1
    end
    
    code.pegs.each do |color|
      other_colors[color] += 1
    end
    
    self_colors.keys.each do |color|
      near_match_count += [self_colors[color], other_colors[color]].min
    end
    
    near_match_count -= self.exact_matches(code)

  end
  
  def ==(code)
    code.is_a?(Code) ? self.pegs == code.pegs : false
  end
  
end

class Game
  attr_reader :secret_code
  
  def initialize(code = Code.random)
    @secret_code = code  
  end
  
  def get_guess
    puts "Please enter a code: "
    begin
      Code.parse(gets.chomp)
    rescue
      puts "Error parsing input."
      retry
    end
  end
  
  def display_matches(code)
    exact_matches = @secret_code.exact_matches(code)
    near_matches = @secret_code.near_matches(code)
    
    puts "#{exact_matches} exact matches"
    puts "#{near_matches} near matches"
  end
  
end
