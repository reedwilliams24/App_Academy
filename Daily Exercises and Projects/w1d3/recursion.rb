
def range(a, b)
  return [] if a >= b-1
  [a+1] + range(a+1, b)
end

class Array
  def iter_sum
    result = 0
    self.each {|num| result+= num}
    result
  end

  def sum
    return 0 if self.count == 0
    self[0] + self[1..-1].sum
  end
end

def exp(base, exponent)
  return 1 if exponent == 0
  base * exp(base, exponent - 1)
end

def exp2(base, exponent)
  return 1 if exponent == 0
  if exponent%2 == 0
    exp2(base, exponent / 2) * exp2(base, exponent / 2)
  else
    base * (exp2(base, (exponent - 1) / 2) * exp2(base, (exponent - 1) / 2))
  end
end

class Array
  def deep_dup
    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr << el.deep_dup
      else
        if el.is_a?(Fixnum)
          arr << el
        else
          arr << el.dup
        end
      end
    end
    arr
  end
end

def fibonacci(n) # = f(n-1) + f(n-2)
  arr = []
  while n >= 1
    arr << fib_sum(n)
    n-=1
  end
  arr.reverse

end

def fib_sum(n)
  return 1 if n == 1 || n == 2
  fib_sum(n-1) + fib_sum(n-2)
end

def fib(n)
  return [0] if n == 0
  return [1] if n == 1
  fib(n-1) + [(fib(n-1)[-1] + fib(n-2)[-1])]
end

def bsearch(array, target)
  return nil if array.length == 0

  middle_idx = array.length/2
  #p array[middle_idx]
  if array[middle_idx] == target
    return middle_idx
  elsif target < array[middle_idx]
    bsearch(array[0...middle_idx],target)
  else
    return nil if bsearch(array[middle_idx+1..-1],target).nil?
    bsearch(array[middle_idx+1..-1],target) + array.length/2 + 1
  end
end


def merge_sort(arr)
  return arr if arr.nil? || arr.length <= 1
  merge(merge_sort(arr[0...(arr.length/2)]),merge_sort(arr[(arr.length/2)..-1]))
end

def merge(array1, array2)
  result = []
  until array1.length == 0 || array2.length == 0
    array1.first > array2.first ? result << array2.shift : result << array1.shift
  end
  until array1.empty?
    result << array1.shift
  end

  until array2.empty?
    result << array2.shift
  end
  result
end

def subsets(arr)
  result = []
  if arr.empty?
    result << []
  else
    result += subsets(arr[0..-2])
    result += subsets(arr[0..-2]).map {|set| set << arr.last}
  end
  result
end

def make_change(amount, coin_choices)
  coins = []
  original_amount = amount

  if coin_choices.count == 1
    until amount == 0
      coins << coin_choices[0]
      amount -= coin_choices[0]
    end

    return coins
  end

  coin_choices.each do |coin|
    if amount >= coin
      until amount < coin
        coins << coin
        amount -= coin
      end
    end
  end

  reduced_coins = make_change(original_amount, coin_choices[1..-1])
  coins.count < reduced_coins.count ? coins : reduced_coins
end

p make_change(14, [10, 7, 1])
p make_change(76, [25, 10, 5, 1])


#a = [1,2,3,4,5]
#b = []
#puts a.iter_sum
#puts a.sum

#puts exp(5,3)
#puts exp2(5,3)

# robot_parts = [["nuts","bolts","washers"],["capacitors","resistors",
# "inductors"]]
# robot_parts_copy = robot_parts.deep_dup
# robot_parts_copy[1] << "LEDs"
# p robot_parts[1]
# p robot_parts_copy[1]
# p [1, [2], [3, [4]]].deep_dup

#p fibonacci(12)
#p fib(12)

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# p subsets([]) # => [[]]
# p "==========================="
# p subsets([1]) # => [[], [1]]
# p "==========================="
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
