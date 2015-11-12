class Queue
  def initialize
    @store = []
  end

  def enqueue(value)
    @store << value
  end

  def dequeue
    @store.unshift
  end

  def peek
    @store
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
