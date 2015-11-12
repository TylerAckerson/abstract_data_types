class Stack
  def def initialize(store = [])
    @store = store
  end

  def pop
    @store.pop
  end

  def push(value)
    @store << value
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
