class MyQueue
  def initialize
    @store = []
  end

  def enqueue(value)
    @store.unshift(value)
  end

  def dequeue(value)
    @store.pop
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
