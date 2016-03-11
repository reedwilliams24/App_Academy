def ask(question)
  while true
    puts question
    reply = gets.chomp.downcase
    if reply == "yes" || reply == "no"
      if reply == "yes"
        return true
      else
        return false
      end
    else
      puts "Please answer \"Yes\" or \"No\""
    end
  end
end

def old_roman_numeral(num)
  number = []
  while num > 0
    if num%1000 == 0 && num >= 1000
      number.push("M")
      num -= 1000
    elsif num%500 == 0 && num >= 500
      number.push("D")
      num -= 500
    elsif num%100 == 0 && num >= 100
      number.push("C")
      num -= 100
    elsif num%50 == 0 && num >= 50
      number.push("L")
      num -= 50
    elsif num%10 == 0 && num >= 10
      number.push("X")
      num -= 10
    elsif num%5 == 0 && num >= 5
      number.push("V")
      num -= 5
    else
      number.push("I")
      num -= 1
    end
  end
  return number.reverse.join("")
end

#puts ask "Do you like turtles?"
puts old_roman_numeral(3123)
