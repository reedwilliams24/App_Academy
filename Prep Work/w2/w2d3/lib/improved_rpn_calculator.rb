require_relative "../../w2d1/lib/00_rpn_calculator.rb"

class RPNCalculator
  
  def evaluate_file(file)
    file.each do |line|
      line = line.chomp
      calc = RPNCalculator.new
      puts calc.evaluate(line)
    end
  end
  
  def user_input
    calc = RPNCalculator.new
    string = ""
    puts "Enter a number or operator. Press enter to quit."
    
    while true
      print " > "
      input = gets.chomp
      break if input.empty?
      string += input + " "
    end
    
    puts " = #{calc.evaluate(string)}"
  end
  
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    RPNCalculator.new.user_input
  else
    File.open(ARGV[0]) { |file| puts RPNCalculator.new.evaluate_file(file) }
  end
end
