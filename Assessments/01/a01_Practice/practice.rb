# def bsearch(array, target)
#   return nil if array.length == 0
#
#   middle_idx = array.length/2
#   return middle_idx if array[middle_idx] == target
#
#   if target < array[middle_idx]
#     bsearch(array[0...middle_idx], target)
#   else
#     idx = bsearch(array[middle_idx+1..-1], target)
#     return nil if idx.nil?
#     middle_idx + 1 + bsearch(array[middle_idx+1..-1], target)
#   end
# end

class Array
  def subsets
    return [[]] if count == 0
    subs = self.take(count-1).subsets
    subs += subs.map { |sub| sub + [self.last] }
    # return [[]] if self.length == 0
    #
    # subs = self.take(self.count-1).subsets
    # subs += subs.map { |sub| sub + [self.last] }
    # #puts "#{self.drop(1).subsets}"
    # subs
  end
end

# def bsearch(array, target)
#   return nil if array.length == 0
#   middle_idx = array.count/2
#
#   if array[middle_idx] == target
#     middle_idx
#   elsif target < array[middle_idx]
#     bsearch(array.take(middle_idx), target)
#   else
#     idx = bsearch(array.drop(middle_idx+1), target)
#     idx.nil? ? nil : idx + middle_idx + 1
#   end
# end

# def fib(n)
#   return [0,1].take(n) if n == 1 || n == 2
#   fibs = fib(n-1)
#   fibs << fibs[-1] + fibs[-2]
# end

def bsearch(array, target)
  return nil if array.count == 0
  middle_idx = array.count/2
  if array[middle_idx] == target
    middle_idx
  elsif target < array[middle_idx]
    bsearch(array[0...middle_idx], target)
  else
    result = bsearch(array[middle_idx+1..-1], target)
    result.nil? ? nil : result + middle_idx + 1
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
