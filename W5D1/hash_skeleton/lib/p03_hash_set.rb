class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(item)
    resize! if @count + 1 > num_buckets
    self[item] << item
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](item)
    # optional but useful; return the bucket corresponding to `num`
    bucket = item.hash % num_buckets
    @store[bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |item|
        new_bucket = item.hash % new_num_buckets
        new_store[new_bucket] << item
      end
    end
    @store = new_store
  end
end
