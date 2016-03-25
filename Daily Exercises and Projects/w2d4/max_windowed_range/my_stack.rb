class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end


  def push(value)
    @store.push(value)
  end


  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
