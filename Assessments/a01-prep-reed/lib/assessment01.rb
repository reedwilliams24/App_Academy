class Array
  def my_inject(accumulator = nil)
    self.each { yield }
    # yield accumulator
  end
end

def is_prime?(num)
  prime = true
  prime = false if num < 2
  idx = 2
  while idx < num
    prime = false if num%idx == 0
    idx += 1
  end
  prime
end

def primes(count)
  result = []
  idx = 0
  num_of_primes = 0
  while num_of_primes < count
    if is_prime?(idx)
      result << idx
      num_of_primes += 1
    end
    idx += 1
  end
  result
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  result = []
  #idx = 0
  return [1] if num == 0
  
  result << (num * factorials_rec(num-1)[0])
  # while idx < num
  #   result << factorial(idx)
  #   idx += 1
  # end
  result
end

def factorial(num)
  return 1 if num == 0 || num == 1
  num * factorial(num-1)
end

class Array
  def dups
    duplicates = Hash.new { [] }
    result = Hash.new
    self.each_with_index do |el, idx|
      duplicates[el] += [idx] if self.count(el) > 1
      #result << idx if self.count(el) > 1
    end
    duplicates
  end
end

class String
  def symmetric_substrings
    beg_idx = 0
    end_idx = self.length
    result = []
    while beg_idx < self.length
      end_idx = beg_idx
      while end_idx < self.length
        if self[beg_idx..end_idx] == self[beg_idx..end_idx].reverse && self[beg_idx..end_idx].length > 1
          result << self[beg_idx..end_idx]
        end
        end_idx += 1
      end
      beg_idx += 1
    end
    result
  end
end

class Array
  def merge_sort(&prc)
    return self if self.length == 1
  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.is_empty? || right.is_empty?
      if left <=> right
        result << right.pop
      else
        result << left.pop
      end
    end
    result
  end
end
