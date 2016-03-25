require_relative 'Card.rb'

class Board
  attr_reader :grid
  def initialize(grid=Array.new(2) { Array.new(2)})
    @grid = grid
  end

  def populate
    cards = []
    (grid[0].count ** 2 / 2).times do |i|
      cards << i
      cards << i
    end
    cards = cards.shuffle

    index = 0
    grid.each_with_index do |row, row_index|
      row.each_with_index do |_, column_index|
        pos = [row_index, column_index]
        self[pos] = Card.new(cards[index])
        index += 1
      end
    end
  end

  def render
    # system("clear")
    grid.each_with_index do |row, row_index|
      row.each_with_index do |_, column_index|
        pos = [row_index, column_index]
        print self[pos].to_s + " "
      end
      puts
    end
  end

  def won?
    grid.each_with_index do |row, row_index|
      row.each_with_index do |_, column_index|
        return false if !grid[row_index][column_index].face_up
      end
    end
    true
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end

  def hide(guessed_pos)
    self[guessed_pos].hide
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

# make syntatic sugar for setter and getter

end
