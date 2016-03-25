class Towers_of_Hanoi
  attr_accessor :towers

  def initialize
    @towers = [[1, 2, 3], [], []]
  end

  def move(start_rod, end_rod)
    return nil if @towers[start_rod].empty?
    if @towers[end_rod].empty?
      top_disc = @towers[start_rod].shift
      @towers[end_rod] << top_disc
    else
      top_disc = @towers[start_rod].first
      bottom_disc = @towers[end_rod].first
      @towers[end_rod] << top_disc if top_disc < bottom_disc
    end
  end

  def game_over
    @towers == [[], [1, 2, 3], []] || @towers == [[], [], [1, 2, 3]]
  end
end
