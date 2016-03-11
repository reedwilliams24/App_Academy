class ComputerPlayer
  
  attr_reader :name, :board
  attr_accessor :mark
  
  def initialize(name)
    @name = name
  end
  
  def get_move
    moves = []
    3.times do |row|
      3.times do |col|
        moves << [row, col] if board.empty?([row, col])
      end
    end
    
    moves.each do |move|
      return move if wins?(move)
    end
    
    moves.sample
  end
  
  def wins?(move)
    board[*move] = mark
    if board.winner == mark
      board[*move] = nil
      true
    else
      board[*move] = nil
      false
    end
  end
  
  def display(board)
    @board = board
  end
  
end
