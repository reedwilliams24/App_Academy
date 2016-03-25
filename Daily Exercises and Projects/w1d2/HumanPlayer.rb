class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_pos(_,_)
    print "Pick a row: "
    guessed_row = gets.chomp

    print "Pick a column: "
    guessed_column = gets.chomp

    [guessed_row, guessed_column]
  end



end
