def sort some_array
  recursive_sort some_array, []
end

def recursive_sort unsorted_array, sorted_array
  smallest_word = unsorted_array.first
  unsorted_array.each { |word| smallest_word = word if word < smallest_word }
  sorted_array.push(smallest_word)
  unsorted_array.delete(smallest_word)
  recursive_sort unsorted_array, sorted_array unless unsorted_array == []
  sorted_array
end

def shuffle some_array
  Random.new_seed
  recursive_shuffle some_array, []
end

def recursive_shuffle unshuffled_array, shuffled_array
  Random.new_seed
  random_idx = rand(unshuffled_array.count)
  shuffled_array.push(unshuffled_array.delete_at(random_idx))
  recursive_shuffle unshuffled_array, shuffled_array unless unshuffled_array == []
  shuffled_array
end

my_array = ["Blue", "green", "red", "black"]



#puts sort my_array
=begin
test_number = 1000
b_count = 0
g_count = 0
r_count = 0
shuffled_my_array = my_array

test_number.times do
  shuffled_my_array = shuffle shuffled_my_array
  if shuffled_my_array.first == "blue"
    b_count += 1
  elsif shuffled_my_array.first == "green"
    g_count += 1
  else
    r_count += 1
  end
end

puts "Blue = #{100.0*b_count/test_number}\nGreen = #{100.0*g_count/test_number}\nRed = #{100.0*r_count/test_number}"
=end
