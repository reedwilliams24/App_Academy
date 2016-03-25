require 'towers_of_hanoi'

describe 'Towers_of_Hanoi' do
  let(:game) {Towers_of_Hanoi.new}

  describe '#initialize' do

    it "returns three disc upon creating the game" do
      expect(game.towers).to eq([[1, 2, 3], [], []])
    end

  end

  describe '#move' do
    before(:each) do
      game.move(0,1)
    end

    it "moves one disc from one tower to another" do
      expect(game.towers).to eq([[2,3],[1],[]])
    end

    it "does not move larger discs on top of smaller discs" do
      game.move(0,1)
      expect(game.towers).to eq([[2,3],[1],[]])
    end

    it "does not take discs from an empty tower" do
      game.move(2,0)
      expect(game.towers).to eq([[2,3],[1],[]])
    end

  end

  describe '#game_over' do
    it "returns false unless the three discs are stacked and not on the first tower" do
      expect(game.game_over).to eq(false)
    end

    it "returns true if the three discs are stacked and not on the first tower" do
      game.towers = [[],[],[1,2,3]]
      expect(game.game_over).to eq(true)
    end
  end

end
