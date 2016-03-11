def greeting

  puts "What is your first name: "
  first_name = gets.chomp

  puts "What is your middle name: "
  middle_name = gets.chomp

  puts "What is your last name: "
  last_name = gets.chomp

  puts "Hello, #{first_name} #{middle_name} #{last_name}."

end

def bigger_number
  puts "What is your favorite number?"
  favorite_number = gets.chomp
  puts "My favorite number is #{favorite_number.to_i+1}. It is better than your number."
end

#greeting
bigger_number
