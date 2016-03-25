class StackQueue

  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def enqueue(value)
    @enqueue_stack.push(value)
  end

  def dequeue
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end

    val = @dequeue_stack.pop

    until @dequeue_stack.empty?
      @enqueue_stack.push(@dequeue_stack.pop)
    end

    val
  end

  def size
    @enqueue_stack.size
  end

  def empty?
    @enqueue_stack.empty?
  end

end
