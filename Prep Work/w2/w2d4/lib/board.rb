# 0,0  0,1  0,2
# 1,0  1,1  1,2
# 2,0  2,1  2,2

class Board
  
  attr_reader :grid, :marks
  
  def self.blank_grid
    Array.new(3) { Array.new(3) }  
  end
  
  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end
  
  def [](row, col)
    grid[row][col]
  end
  
  def []=(row, col, mark)
    grid[row][col] = mark  
  end
  
  def place_mark(pos, mark)
    self[*pos] = mark
  end
  
  def empty?(pos)
    self[*pos] == nil ? true : false
  end
  
  def winner
    #Rows
    3.times do |row|
      return self[row,0] if self[row,0] == self[row,1] && self[row,1] == self[row,2] && !self.empty?([row,0])
    end
    
    #Columns
    3.times do |col|
      return self[0,col] if self[0,col] == self[1,col] && self[1,col] == self[2,col] && !self.empty?([0,col])
    end
    
    #Diagonals
    return self[0,0] if self[0,0] == self[1,1] && self[1,1] == self[2,2] && !self.empty?([0,0])
    return self[2,0] if self[2,0] == self[1,1] && self[1,1] == self[0,2] && !self.empty?([2,0])
    
    nil
  end
  
  def over?
    over = true
    
    3.times do |row|
      3.times do |col|
        over = false if self.empty?([row, col])
      end
    end
    
    over = true unless winner == nil
    
    over
  end
  
end
