class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    self.store[num] = true
  end

  def remove(num)
    validate!(num)
    self.store[num] = false
  end

  def include?(num)
    validate!(num)
    self.store[num]
  end

  private

  def is_valid?(num)
    num < self.store.length && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_id = num % num_buckets
    store[bucket_id] << num
  end

  def remove(num)
    bucket_id = num % num_buckets
    store[bucket_id].delete(num)
  end

  def include?(num)
    bucket_id = num % num_buckets
    store[bucket_id].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if self.count == num_buckets
    if count < num_buckets
      bucket_id = num % num_buckets
      store[bucket_id] << num
      self.count += 1
    end
    nil
  end

  def remove(num)
    bucket_id = num % num_buckets
    store[bucket_id].delete(num)
    self.count -= 1

    nil
  end

  def include?(num)
    bucket_id = num % num_buckets
    store[bucket_id].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.flatten.each { |item| self.insert(item) }
    self.count = old_store.length
  end
end
