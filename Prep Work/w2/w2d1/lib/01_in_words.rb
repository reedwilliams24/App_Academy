ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

MAGNITUDES = {
  100 => "hundred",
  1000 => "thousand",
  1_000_000 => "million",
  1_000_000_000 => "billion",
  1_000_000_000_000 => "trillion"
}

class Fixnum
  def in_words
    num = self
    words = []
    
    return ONES[num] if num == 0
    
    while num > 0
      if num < 10
        words << ONES[num]
        num = 0
      elsif num < 20
        words << TEENS[num]
        num = 0
      elsif num < 100
        words << TENS[num-num%10]
        num = num % 10
      else
        magnitude = find_magnitude(num)
        (num/magnitude).in_words.split(" ").each { |word| words << word }
        words << MAGNITUDES[magnitude]
        num = num % magnitude
      end
    
    end
    
    words.pop if words.count > 1 && words.last == "zero"
    words.join(" ")
  end
  
  def find_magnitude(num)
    magnitude = MAGNITUDES.keys.first
    MAGNITUDES.each_key do |key|
      magnitude = key if num >= key
    end
    magnitude
  end
  
end