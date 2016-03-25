class Array
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc = Proc.new { |x, y| x <=> y } if prc.nil?

    sorted = false
    until sorted
      sorted = true

      (0...(count - 1)).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          # Parallel assignment; use it when swapping.
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end
end

class Array
  def pair_sum(target)
    pairs = []
    self.each_with_index do |el, first_idx|
      ((first_idx + 1)...self.length).each do |second_idx|
        if el + self[second_idx] == target
          pairs << [first_idx, second_idx]
        end
      end
    end
    pairs
  end
end

class Array
  def my_flatten(level = nil)
    duped = self.dup
    return duped if level == 0
    next_level = level ? level - 1 : nil

    each_with_index do |el, i|
      duped[i..i] = el.my_flatten(next_level) if el.is_a?(Array)
    end

    duped
  end
end

class String
  def shuffled_sentence_detector(other)
    self.split.sort == other.split.sort
  end
end

def prime?(num)
  return false if num <= 1
  (2...num).none? { |factor| num % factor == 0 }
end

def sum_n_primes(n)
  result = 0
  number = 0
  until n.zero?
    number += 1
    if prime?(number)
      result += number
      n -= 1
    end
  end
  result
end

class Array
  def my_each(&blk)
    i = 0
    while i < length
      blk.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  def my_inject(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

