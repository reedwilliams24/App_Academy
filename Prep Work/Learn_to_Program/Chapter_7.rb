def nine_nine_bottles_of_beer
  bottles = 99
  while bottles > 0
    puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer. Take one down, pass it around. #{bottles-1} bottles of beer on the wall."
    bottles -= 1
  end
end

def deaf_grandma

  speak = gets.chomp
  bye_count = 0
  while true
    if speak == speak.upcase
      year = rand(21) + 1930
      if speak == "BYE"
        bye_count += 1
        break if bye_count == 3
      else
        bye_count = 0
      end
      puts "NO, NOT SINCE #{year}!"
    else
      puts "HUH?! SPEAK UP, SONNY!"
      bye_count = 0
    end
    speak = gets.chomp
  end
end

def leap_years
  print "Beginning Year:"
  year_beg = gets.chomp.to_i
  print "End Year:"
  year_end = gets.chomp.to_i

  year = year_beg
  while year <= year_end
    if year%4 == 0 && (year%100 != 0 || year%400 == 0)
      puts year
    end
    year += 1
  end

end

#nine_nine_bottles_of_beer
#deaf_grandma
leap_years
