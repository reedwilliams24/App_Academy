# We're going to implement a cipher called the Folding Cipher. Why? Because it
# folds the alphabet in half and uses the adjacent letter.
#
# For example,
# a <=> z
# b <=> y
# c <=> x
# ...
# m <=> n

def folding_cipher(str)
  idx = 0
  while idx < str.length-1

    idx+=1
  end
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num <= 10

  result = 0
  while num > 0
    result += num%10
    num = num/10
  end
  result > 10 ? digital_root(result) : result
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'olleh'

def jumble_sort(str, alphabet = nil)
  letters = str.split("")
  result = []
  if alphabet.nil?
    ("a".."z").each { |el| result << el * letters.count(el) }
  else
    alphabet.each { |el| result << el * letters.count(el) }
  end
  result.join("")
end

class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    self == self.select { |el| self.count(el) == 1} ? false : true
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    begin_pos = 0
    end_pos = 1
    subwords = []

    while begin_pos < self.length
      end_pos = 1
      while end_pos < self.length
        subword = self[begin_pos..end_pos]
        dictionary.include?(subword) ? subwords << subword : nil
      end_pos += 1
      end
      begin_pos += 1
    end

    subwords.uniq

  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factor = 1
  result = []
  while factor <= num
    num%factor == 0 ? result << factor : nil
    factor += 1
  end
  result
end
