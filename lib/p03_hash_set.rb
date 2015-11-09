require_relative 'p02_hashing'

class HashSet
  attr_accessor :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count >= num_buckets

    if count < num_buckets
      hash = key.hash
      bucket_id = hash % num_buckets
      self.store[bucket_id] << key
      self.count += 1
    end
  end

  def include?(key)
    hash = key.hash
    bucket_id = hash % num_buckets
    store[bucket_id].include?(key)
  end

  def remove(key)
    hash = key.hash
    bucket_id = hash % num_buckets
    store[bucket_id].delete(key)
    self.count -= 1
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
