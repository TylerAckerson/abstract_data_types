class MinMaxStack
  def initialize(store = [])
    @store = store
  end

  def pop
    @store.pop[:value]
  end

  def push(value)
    if @store.empty?
      @store << { value: value,
                    min: value,
                    max: value}
    else
      @store << { value: value,
                    min: [@store.last[:min], value].min,
                    max: [@store.last[:max], value].max}
    end
  end

  def min
    @store.empty? ? nil : @store.last[:min]
  end

  def max
    @store.empty? ? nil : @store.last[:max]
  end

  def peek
    @store.last[:value]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
