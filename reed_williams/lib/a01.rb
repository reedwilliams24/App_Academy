class Array
  # Write an Array method that returns a bubble-sorted copy of an array
  def bubble_sort(&prc)
    sorted = false
    array = self
    #until sorted = true
    #  sorted = true
      idx = 0
      while idx < self.length - 1
        if block_given?
          #array[idx], array[idx+1] = array[idx+1], array[idx] if prc.call(array[idx+1], array[idx])
        case prc.call(array[idx], array[idx+1])
        when 1
          array[idx],array[idx+1] = array[idx+1],array[idx]
        end
        else
          array[idx], array[idx+1] = array[idx+1], array[idx] if array[idx] < array[idx+1]
        end
        idx += 1
      end

    #end
    self
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    idx_beg = 0
    result = []
    while idx_beg < self.count-1
      idx_end = idx_beg + 1
      while idx_end < self.count
        result << [idx_beg, idx_end] if self[idx_beg]+self[idx_end] == target
        idx_end += 1
      end
      idx_beg += 1
    end
    result
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nexted arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    result = []
    #array = self
    # if level.nil?
    self.each do |el|
      if el.is_a?(Array)
        result << el.my_flatten
      else
        result << el
      end
    end
    # else
      #
    # end
    result
  end
end

class String
  # This method returns true if the sentence passed as an argument
  # can be created by rearranging the receiving string.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cats are cool".shuffled_sentence_detector("cool cats are") => true

  def shuffled_sentence_detector(other)
    shuffled_sentence = true
    #idx = 0
    words = self.split(" ")
    other_words = self.split(" ")
    other_words.each do |word|
      shuffled_sentence = false if other.count(word) != self.count(word)
    end
    # words.each do |word|
    #   shuffled_sentence = false if other.count(word) != self.count(word)
    # end


    shuffled_sentence
  end
end

def prime?(num)
  prime = true
  idx = 2
  while idx < num
    prime = false if num%idx == 0
    idx += 1
  end
  prime
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  #return 2 if n == 1
  idx = 2
  count = 0
  sum = 0
  while count < n
    if prime?(idx)
      sum += idx
      count += 1
    end
    idx += 1
  end
  sum
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    self
  end
end

class Array
  def my_inject(accumulator = nil, &prc)
    idx = 0
    if accumulator.nil?
      #accumulator = self[idx]
      prc.call(self[idx], self[idx])
      idx += 1
    end

    while idx < self.count
      prc.call(accumulator, self[idx])
      idx += 1
    end
  
  end
end
