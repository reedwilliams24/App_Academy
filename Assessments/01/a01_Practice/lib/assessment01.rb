# class Array
#   def my_inject(accumulator = nil, &prc)
#     i = 0
#     if accumulator.nil?
#       accumulator = self.first
#       i += 1
#     end
#
#     while i < length
#       p accumulator
#       p self[i]
#       accumulator = prc.call(accumulator, self[i])
#       p accumulator
#       p "---"
#       i += 1
#     end
#     accumulator
#   end
# end
#
# def is_prime?(num)
#   return false if num < 2
#   return true if num == 2
#
#   idx = 2
#   while idx < num
#     return false if num%idx == 0
#     idx += 1
#   end
#   true
# end
#
# def primes(count)
#   result = []
#   idx = 2
#   while result.length < count
#     result << idx if is_prime?(idx)
#     idx += 1
#   end
#   result
# end
#
# # the "calls itself recursively" spec may say that there is no method
# # named "and_call_original" if you are using an older version of
# # rspec. You may ignore this failure.
# # Also, be aware that the first factorial number is 0!, which is defined
# # to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# def factorials_rec(num)
#   return [1] if num == 1
#   # return [1 , 1] if num == 1
#   result = []
#   result += factorials_rec(num-1)
#   result << (num-1) * factorials_rec(num - 1).last
#   result
# end
#
# class Array
#   def dups
#     result = Hash.new
#     self.each do |num|
#       indices = []
#       self.each_with_index do |num2, idx|
#         indices << idx if num == num2
#       end
#       result[num] = indices if indices.count > 1
#     end
#     result
#   end
# end
#
# class String
#   def symmetric_substrings
#     result = []
#     idx_beg = 0
#
#     while idx_beg < self.length
#       idx_end = idx_beg+1
#       while idx_end < self.length
#         substring = self[idx_beg..idx_end]
#         if substring.length > 1 && substring == substring.reverse
#           result << substring
#         end
#         idx_end += 1
#       end
#       idx_beg += 1
#     end
#     result
#   end
# end
#
# # class Array
# #   def merge_sort(&prc)
# #     return self if self.length < 2
# #     prc ||= Proc.new { |a,b| a <=> b}
# #
# #     middle = self.length/2
# #     left = self.take(middle)
# #     right = self.drop(middle)
# #
# #     Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
# #
# #   end
# #
# #   private
# #   def self.merge(left, right, &prc)
# #     sorted_array = []
# #     until left.empty? || right.empty?
# #       case prc.call(left.first, right.first)
# #       when 1
# #         sorted_array << right.shift
# #       else
# #         sorted_array << left.shift
# #       end
# #     end
# #
# #     until left.empty?
# #       sorted_array << left.shift
# #     end
# #
# #     until right.empty?
# #       sorted_array << right.shift
# #     end
# #     sorted_array
# #   end
# # end
#
# class Array
#   def merge_sort(&prc)
#     return self if length < 2
#     prc ||= Proc.new { |x,y| x <=> y }
#
#     middle = self.length/2
#     left = self.take(middle)
#     right = self.drop(middle)
#
#     Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
#   end
#
#   private
#   def self.merge(left, right, &prc)
#     sorted_array = []
#     until left.empty? || right.empty?
#       case prc.call(left.first, right.first)
#       when 1
#         sorted_array << right.shift
#       else
#         sorted_array << left.shift
#       end
#     end
#
#     until left.empty?
#       sorted_array << left.shift
#     end
#
#     until right.empty?
#       sorted_array << right.shift
#     end
#
#     sorted_array
#   end
# end

class Array
  def my_inject(accumulator = nil, &prc)
    i = 0

    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < self.length
      accumulator = prc.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

def is_prime?(num)
  return false if num < 2
  prime = true
  idx = 2
  while idx < num
    prime = false if num%idx == 0
    idx += 1
  end
  prime
end

def primes(count)
  idx = 1
  num = 0
  result = []
  until num == count
    if is_prime?(idx)
      result << idx
      num += 1
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
  return [1,1].take(num) if num == 1 || num == 2
  factorials_rec(num-1) + [(num-1) * factorials_rec(num-1).last]
end

class Array
  def dups
    result = Hash.new

    self.each do |num|
      indices = []
      self.each_with_index do |num2, idx|
        indices << idx if num == num2
      end
      result[num] = indices if indices.count > 1
    end
    result
  end
end

class String
  def symmetric_substrings
    symmetric_substrings = []
    idx_beg = 0

    while idx_beg < self.length
      idx_end = idx_beg + 1
      while idx_end < self.length
        word = self[idx_beg..idx_end]
        symmetric_substrings << word if word == word.reverse
        idx_end += 1
      end
      idx_beg += 1
    end
    symmetric_substrings
  end
end

class Array
  def merge_sort(&prc)
    return self if count < 2
    prc ||= Proc.new {|x,y| x <=> y}

    middle_idx = self.length/2
    left = self.take(middle_idx)
    right = self.drop(middle_idx)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted_array = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        sorted_array << left.shift
      else
        sorted_array << right.shift
      end
    end

    until left.empty?
      sorted_array << left.shift
    end

    until right.empty?
      sorted_array << right.shift
    end

    sorted_array
  end
end
