class HumanPlayer
  
  def initialize(name)
    @name = name
  end
  
  def get_play
      puts "Enter coordinates 'x,y': "
      cords = gets.chomp
      while cords.count(",") != 1
        puts "Invalid input. Enter coordinates 'x,y': "
        cords = gets.chomp
      end
      cords = cords.split(",")
      cords.map { |cord| Integer(cord) }
  end
  
end
