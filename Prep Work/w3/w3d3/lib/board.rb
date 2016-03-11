class Board
  
  attr_reader :grid
  
  DISPLAY = {
    nil => " ",
    :s => " ",
    :x => "X"
  }
  
  def initialize(grid = Board.default_grid, random = false)
    @grid = grid
    randomize if random
  end
  
  def self.default_grid
    Array.new(10) { Array.new(10) }
  end
  
  def self.random_grid
    self.new(self.default_grid, true)
  end
  
  def count
    grid.flatten.select { |el| el == :s }.length
  end
  
  def [](pos)
    x = pos[0]
    y = pos[1]
    grid[x][y]
  end
  
  def []=(pos, mark)
    x = pos[0]
    y = pos[1]
    grid[x][y] = mark
  end
  
  def empty?(pos = nil)
    if pos != nil 
      self[pos] == nil ? true : false
    else
      self.grid.flatten.all? { |el| el == nil }
    end
  end
  
  def full?
    !self.grid.flatten.any? { |el| el == nil }
  end
  
  def valid_play?(pos)
    rows = grid.length
    cols = grid.flatten.length/grid.length
    
    return false if !pos.is_a?(Array)
    
    return (pos[0] > rows || pos[1] > cols) ? false : true
  end
  
  def place_random_ship
      raise "Board is full." if full?
      pos = random_pos
      
      until empty?(pos)
        pos = random_pos
      end
      
      self[pos] = :s
      
  end
  
  def random_pos
    rand1 = rand(grid.length)
    rand2 = rand(grid.length)
    [rand1, rand2]
  end
  
  def randomize(count = 10)
    count.times { place_random_ship }
  end
  
  def won?
    grid.flatten.none? { |pos| pos == :s }
  end
  
  def display
    header = []
    cols = grid.flatten.length/grid.length
    
    cols.times do |col|
      header << col
    end
    puts "  #{header.join(" ")}"
    
    grid.each_with_index do |row, idx|
      puts "#{idx} #{display_row(row)}"
    end
    
  end
  
  def display_row(row)
    row.map { |el| DISPLAY[el] }.join(" ")
  end
  
end