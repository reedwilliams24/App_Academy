module TicTacToe
  class Board
    attr_accessor :grid
    def initialize(input = Array.new(3) {Array.new(3)} )
      @grid = input
      #@grid = Array.new(3) {Array.new(3)}
    end

    def get_cell(x, y)
      @grid[x][y]
    end

    def set_cell(x, y, value)
      @grid[x][y] = value
    end

    def game_over

    end

    def formatted_grid

    end

    private

    def default_grid

    end

    def draw?

    end

    def winner?

    end

    def winning_position_values(winning_position)

    end

    def winning_positions

    end

    def diagonals

    end

  end
end
