class HumanPlayer
  
  attr_reader :name
  attr_accessor :mark
  
  def initialize(name)
    @name = name
  end
  
  def get_move
    puts "Where would you like to move (row, col): "
    move = gets.chomp.split(", ")
    move[0] = Integer(move[0])
    move[1] = Integer(move[1])
    move
  end
  
  def display(board)
    rows = ["", "", ""]
    
    3.times do |row|
      3.times do |col|
        rows[row] << "#{row}  "
        board.empty?([row, col]) ? rows[row] += "  -  " : rows[row] += "  #{board[row, col]}  "
      end
    end
    
    puts "   0    1    2" 
    puts rows[0]
    puts rows[1]
    puts rows[2]
    
  end
  
end