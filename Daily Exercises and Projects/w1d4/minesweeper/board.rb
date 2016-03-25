require_relative 'tile'
require 'byebug'

class Board
  attr_reader :grid, :bomb_hash

  def empty_grid
    Array.new(9) { Array.new(9) { Tile.new(false) } }
  end

  def initialize(grid = empty_grid)
      @grid = grid
  end

  def generate_bombs
    (grid.length**2/2).times do
      rand1 = rand(grid.length)
      rand2 = rand(grid.length)
      @grid[rand1][rand2].bomb = true
    end
  end

  def render
    puts "  #{(0..8).to_a.join(" ")}"
    grid.each_with_index do |row, i|
      #byebug
      #puts "#{i} #{row.each {|tile| tile.bomb}.join(" ")}"
      print "#{i} "
      a = row.each do |tile|
        print "#{tile.bomb == true ? "B" : "."} "
      end
      puts ""
    end
  end

  def create_bomb_hash
    @bomb_hash = Hash.new
    @grid.each_with_index do |row, x|
      row.each_with_index do |_, y|
      #  byebug
        if grid[x][y].bomb
          @bomb_hash[[x,y]] = "B"
        else
          @bomb_hash[[x,y]] = 0
        end
      end
    end
    @bomb_hash
  end

  def count_bombs
    @bomb_hash.each do |position|
      x, y = position[0]
            byebug
    end
  end

end

a = Board.new
a.generate_bombs
a.render
p a.create_bomb_hash
a.count_bombs
