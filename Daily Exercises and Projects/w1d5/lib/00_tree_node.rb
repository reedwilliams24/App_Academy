require 'byebug'

class PolyTreeNode
  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    node.children.push(self) unless node.nil?
  end

  def add_child(node)
    unless @children.include?(node)
      # @children << node
      node.parent=self
    end
  end

  def remove_child(node)
    raise error unless children.include?(node)
    node.parent=nil
    @children.delete(node)
  end

  def dfs(target_value)
    return self if @value == target_value
    #return nil if children.empty?
    @children.each do |child|
      check = child.dfs(target_value)
      return check if check
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      return queue.first if queue.first.value == target_value
      queue.shift.children.each {|child| queue << child }
    end
  end

  # def inspect
  #   { 'value' => @value, 'parent_value' => @parent.value}.inspect
  # end

end

# a = PolyTreeNode.new("a")
# b = PolyTreeNode.new("b")
# c = PolyTreeNode.new("c")
# d = PolyTreeNode.new("d")
# e = PolyTreeNode.new("e")
#
# a.add_child(b)
# a.add_child(c)
# c.add_child(d)
# c.add_child(e)
#
# p a.dfs("d")
