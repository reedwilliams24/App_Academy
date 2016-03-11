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
  folded_alphabet = Hash.new
  reversed_alphabet = ('a'..'z').to_a.reverse
  ('a'..'z').to_a.each_with_index do |letter, idx|
    folded_alphabet[letter] = reversed_alphabet[idx]
  end

  str.split("").collect{|letter| folded_alphabet[letter]}.join("")
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10

  result = 0
  while num > 0
    result += num%10
    num/=10
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
  alphabet ||= ('a'..'z').to_a
  sorted_chars = str.chars.sort do |char1, char2|
    alphabet.index(char1) <=> alphabet.index(char2)
  end
  sorted_chars.join("")
end

class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    duplicates = false
    self.each {|word| duplicates = true if self.count(word) > 1 }
    duplicates
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.
  def real_words_in_string(dictionary)
    result = []
    beg_idx = 0


    while beg_idx < self.length
      end_idx = 0
      while end_idx < self.length
        result << self[beg_idx..end_idx] if dictionary.include?(self[beg_idx..end_idx])
        end_idx += 1
      end
      beg_idx += 1
    end
    result.uniq
  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  idx = 1
  result = []
  while idx <= num
    result << idx if num%idx == 0
    idx += 1
  end
  result
end
