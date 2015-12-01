class Heap
  def initialize(values = [])
    @store = []
    values.each { |val| self.insert(val) }
  end

  def peek_min
    @store.first
  end

  def pop_min
    return nil if @store.empty?
    swap!(0,-1)
    min = @store.pop

    heapify_down!
    min
  end

  def swap!(index1, index2)
    @store[index1], @store[index2] = @store[index2], @store[index1]
  end

  def insert(val)
    @store << val

    heapify_up!
  end

  private

  def parent_idx(idx)
    idx.zero? ? 0 : (idx - 1) / 2
  end

  def children_idx(idx)
    [(2*idx + 1), (2*idx + 2)].select { |idx| idx < @store.length }
  end

  def heapify_up!
    idx = @store.length - 1

    while idx > 0
      parent = parent_idx(idx)

      if @store[idx] < @store[parent]
        swap!(idx, parent)
        idx = parent
      else
        break
      end

    end
  end

  def heapify_down!
    i = 0

    loop do
      smallest_child_idx = children_idx(i).min_by { |idx| @store[idx] }
      break if smallest_child_idx.nil?

      if @store[i] > @store[smallest_child_idx]
        swap!(i, smallest_child_idx)
        i = smallest_child_idx
      else
        break
      end

    end
  end

end
