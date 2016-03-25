def my_min(list)
  min = list.first
  temp_min = list.first
  list.each do |val1|
    list.each do |val2|

      val1  < val2 ? temp_min = val1 : temp_min = val2
      temp_min  < min ? min = temp_min : nil

    end

  end

  # min = list.first
  # list.each {|el| min = el if el < min}
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # =>  -5



def largest_contiguous_subsum(list)
  a = []
  list.each_with_index do |v,i|
    list.each_with_index do |v2,i2|
      a << list[i..i2].reduce(:+) if i2 > i
    end
  end
  a.max
  #a.max
end

list = [5,3,-7]
largest_contiguous_subsum(list) # => 8
#

def largest_contiguous_subsum_2(list)
  largest_sum = list[0]
  #temp_sum_start = list[0]
  temp_sum = 0

  list.each_with_index do |num, idx|
    if num < 0
      temp_sum = num
    else
      temp_sum += num
    end
    largest_sum = temp_sum if temp_sum > largest_sum
  end
  largest_sum
end


def largest_contiguous_subsum_2(list)
  largest_sum = list[0]
  temp_sum = 0


  list.each_with_index do |num, idx|
    if num > 0 || list[(idx..-1)].reduce(:+) > (temp_sum + num) ##########list.drop(idx+1).reduce(:+) >
      temp_sum += num
    end
    if list[idx..-1].reduce(:+) > 0
      nil
    else
      if temp_sum > largest_sum
         largest_sum = temp_sum
         temp_sum = 0
      else
        temp_sum = 0
      end
    end
  end
    temp_sum > largest_sum ? (temp_sum):largest_sum
end

list = [5,3,-7,-20,1100,-2]
p largest_contiguous_subsum_2(list) # => 8
