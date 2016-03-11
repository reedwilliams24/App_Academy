class RPNCalculator
  
  attr_accessor :memory
  
  OPERATORS = [:+, :-, :*, :/]
  
  def initialize
    @memory = []
  end
  
  def value
    memory.last
  end
  
  def empty_calculator
    raise "calculator is empty"
  end
  
  def push(num)
    memory << num
  end
  
  def plus
    if memory.count > 1
      memory << memory.pop + memory.pop
    else
      empty_calculator
    end
  end
  
  def minus
    if memory.count > 1
      memory << -memory.pop + memory.pop
    else
      empty_calculator
    end
  end
  
  def divide
    if memory.count > 1
      memory << (1.0/memory.pop) * memory.pop
    else
      empty_calculator
    end
  end
  
  def times
    if memory.count > 1
      memory << memory.pop * memory.pop
    else
      empty_calculator
    end
  end
  
  def tokens(string)
    chars = string.split(" ")
    chars.map! do |char|
      if OPERATORS.include?(char.to_sym)
        char.to_sym
      else
        Integer(char)
      end
    end
    chars
  end
  
  
  def evaluate(string)
    chars = tokens(string)
    chars.each do |char|
      case char
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else 
        push(Integer(char))
      end
    end
    value
  end
  
end
