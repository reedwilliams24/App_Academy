def folding_cipher(str)
  alphabet = Hash.new
  a = ("a".."z").to_a
  b = ("a".."z").to_a.reverse
  a.each_with_index do |letter, idx|
    alphabet[letter] = b[idx]
  end

  result = ""
  str.split("").each do |letter|
    result += alphabet[letter]
  end
  result

end

def digital_root(num)
  return num if num <= 10
  result = num%10
  result += digital_root(num/10)
  result > 10 ? digital_root(result) : result
end

def digital_root_step(num)

end

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  result = ""

  alphabet.each do |letter|
    (str.count(letter)).times {result += letter}
  end

  result
end

  # sorted = false
  # until sorted = true
  #   sorted = true
  #   idx = 0
  #   while idx < str.length-1
  #     if alphabet.index(str[idx]) < alphabet.index(str[idx+1])
  #       str[idx], str[idx+1] = str[idx+1], str[idx]
  #       sorted = false
  #     end
  #     idx += 1
  #   end
  #   # str.split("").map_with_index! do |_,idx|
  #     # if idx < str.length-1
  #     #   if alphabet.index(str[idx]) < alphabet.index(str[idx+1])
  #     #     str[idx], str[idx+1] = str[idx+1], str[idx]
  #     #     sorted = false
  #     #   end
  #     # end
  #   # end
  # end
  # str
#end

# Alternately:
#
# def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a
#
#   sorted_chars = str.chars.sort do |chr1, chr2|
#     alphabet.index(chr1) <=> alphabet.index(chr2)
#   end
#
#   sorted_chars.join
# end

class Array
  def dups?
    duplicates = false
    self.each do |num|
      duplicates = true if self.count(num) > 1
    end
    duplicates
  end
end

class String
  def real_words_in_string(dictionary)
    idx_beg = 0
    result = []
    while idx_beg < self.length
      idx_end = idx_beg
      while idx_end < self.length
        if dictionary.include?(self[idx_beg..idx_end])
          result << self[idx_beg..idx_end]
        end
        idx_end += 1
      end
      idx_beg += 1
    end
    result.uniq
  end
end

def factors(num)
  idx = 1
  result = []
  while idx <= num
    result << idx if num%idx == 0
    idx += 1
  end
  result
end


# def folding_cipher(str)
#   folded_alphabet = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
#   str.chars.map { |chr| folded_alphabet[chr] }.join
# end
#
# def digital_root(num)
#   while num > 10
#     num = digital_root_step(num)
#   end
#
#   num
# end
#
# def digital_root_step(num)
#   root = 0
#   while num > 0
#     root += (num % 10)
#
#     num /= 10
#   end
#
#   root
# end
#
# def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a
#
#   sorted = false
#   until sorted
#     sorted = true
#
#     str.length.times do |i|
#       break if i == (str.length - 1)
#       if alphabet.index(str[i]) > alphabet.index(str[i + 1])
#         str[i], str[i + 1] = str[i + 1], str[i]
#         sorted = false
#       end
#     end
#   end
#
#   str
# end
#
# # Alternately:
# #
# # def jumble_sort(str, alphabet = nil)
# #   alphabet ||= ('a'..'z').to_a
# #
# #   sorted_chars = str.chars.sort do |chr1, chr2|
# #     alphabet.index(chr1) <=> alphabet.index(chr2)
# #   end
# #
# #   sorted_chars.join
# # end
#
# class Array
#   def dups?
#     elements = Hash.new(false)
#     each do |item|
#       return true if elements[item]
#       elements[item] = true
#     end
#     false
#   end
# end
#
# class String
#   def real_words_in_string(dictionary)
#     real_words = []
#     (1...self.length - 1).each do |first|
#       (first + 1...self.length).each do |last|
#         word = self[first...last]
#         if dictionary.include?(word)
#           real_words << word unless real_words.include?(word)
#         end
#       end
#     end
#     real_words
#   end
# end
#
# def factors(num)
#   (1..num).select { |i| (num % i) == 0 }
# end
