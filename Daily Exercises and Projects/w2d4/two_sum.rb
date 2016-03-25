require 'byebug'

# O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      return true if num1 + num2 == target_sum && idx1 != idx2
    end
  end
  false
end

# EX:
arr = [0, 1, 5, 7]
#p bad_two_sum?(arr, 6) # => should be true
#p bad_two_sum?(arr, 10) # => should be false
# def binary(list,target)
#
#   pos = list.count/2
#   if list.count < = 2
#     return true if list[0] == target
#     return true if list[1] == target
#     return true if list.reduce(:+) == target
#     return false
#   else
#     if list[pos] == target
#       return true
#     elsif list[pos] + list[pos +1 ] == target
#       return true
#     elsif list[pos] > target
#       binary(list.take(list.count/2),target)
#     else
#       binary(list.drop(list.count/2),target)
#     end
#
# end
#
#
# def coin((array, target))
#   return true if a == [target]
# else
#   count = 0
#   a.each do |v|
#     break if count ==2
#     coin(v,t- v.pop)
#     break if
# end
# return false
# end

def okay_two_sum?(arr, target)
  #idx = arr.count/2
  idx = 0
  while idx < arr.length
    #return true if bsearch(arr.take(arr.count/2), idx, target) + idx == target
    #num2 = arr.bsearch{|x| x + arr[idx] == target}
    num2 = arr.bsearch{|x| target - x - arr[idx]}
    idx2 = arr.index(num2)

    if !num2.nil? && idx != idx2
      return true #if num2 + arr[idx] == target
    end
    idx += 1
  end
  false
end

# def bsearch(arr, num, target)
#   return num2 if num + num2 == target && arr.length == 1
#   if num + num2 < target
#     bsearch(arr.take(arr))
#   else
#     #
#   end
# end


# EX:
arr = [0, 1,3,4,5 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 12) # => should be true
p okay_two_sum?(arr, 1) # => should be true


def two_sum_hash?(arr, target)
  h = Hash.new
  idx = 0
  while idx < arr.length-2
    h[arr[idx]] = arr[idx+1]
  end



end


def two_sum?(arr, target_sum)
  complements = {}

  arr.each do |el|
    byebug
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end

p two_sum?(arr, 6) # => should be true
