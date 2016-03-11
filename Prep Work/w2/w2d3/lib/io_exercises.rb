# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  secret_number = rand(1..10)
  guesses = 0
  
  while true
    guesses += 1
    print "Please guess a number: "
    guess = Integer(gets.chomp)
    
    case guess <=> secret_number
      when -1
        puts "Your guess of #{guess} was too low."
      when 0
        puts "Your guess of #{guess} was correct!"
        break
      when 1
        puts "Your guess of #{guess} was too high."
    end
  end
  
  puts "It took you #{guesses} guesses."
  
end

def shuffle_file(filename)
  base = File.basename(filename, ".*")
  File.open("#{base}-shuffled.txt", "w") do |f|
    File.readlines(filename).shuffle.each do |line|
      f.puts line.chomp  
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "Enter filename to shuffle:"
    filename = gets.chomp
    shuffle_file(filename)
  end
end