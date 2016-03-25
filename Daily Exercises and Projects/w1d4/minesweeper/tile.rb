class Tile
  attr_accessor :bomb, :picked

  def initialize(bomb_present)
    @bomb = bomb_present
    @picked = false
  end

  def reveal
    @picked = true
  end



end
