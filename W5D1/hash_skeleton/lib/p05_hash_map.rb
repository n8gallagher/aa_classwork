require_relative "p04_linked_list"

class HashMap
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    this_linked_list = @store[bucket]
    node = this_linked_list[key]
    if node.include?(key)
      return node.append(key, val)
    else
      node.update(key, val)
    end
  end

  def get(key)
    bucket = bucket(key)
    this_linked_list = @store[bucket] #returns LinkedList
    node = this_linked_list[key]
    node
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
