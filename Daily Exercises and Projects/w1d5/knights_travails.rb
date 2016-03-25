require_relative "lib/00_tree_node.rb"

class KnightPathFinder

  def initialize(start)
    @root=PolyTreeNode.new(start)
    @visited_positions=[@root]
  end

  def find_path(pos)
    end_node = build_move_tree(pos)
    path = [end_node.value]

    until end_node == @root
      path << end_node.parent.value
      end_node = end_node.parent
    end

    path.reverse
  end

  def valid_moves(node,move)
    x,y =move
    return false if (x > 8 || x < 0 || y > 8 || y < 0 )
    return false if check_history(node).include?(move)
    # p @visited_positions.values.include?(pos)
    # @visited_positions.map(&:value)
    true
  end

  def check_history(node)
    return [node.value] if node.parent.nil?
    [node.value]+ check_history(node.parent)
  end

  def new_move_positions(node)
    x,y = node.value
    moves=[x-2, x+2].product([y-1,y+1])+[x-1,x+1].product([y-2,y+2])
    a=moves.select{|move| valid_moves(node,move)}
  end

  def build_move_tree(pos)
    queue=[@root]

    until queue.empty?
      current=queue.shift
      moves = new_move_positions(current)

      moves.each do |move|
        child = PolyTreeNode.new(move)
        current.add_child(child)
        queue << child
        return queue.last if child.value == pos
      end
    end
    queue.last
  end

end

 # a = KnightPathFinder.new([0,0])
 # p a.find_path([7,6])
