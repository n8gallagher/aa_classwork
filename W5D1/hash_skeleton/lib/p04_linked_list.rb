class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](key)
    each { |node| return node if key == node.key }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if key == node.key }
    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, value)
    current_last = @tail.prev
    new_node = Node.new(key, value)
    new_node.prev = current_last
    new_node.next = @tail
    current_last.next = new_node
    @tail.prev = new_node
  end

  def update(key, value)
    if self.include?(key)
      self[key].val = value
    end
  end

  def remove(key)
    node = self[key]
    current_next = node.next
    current_prev = node.prev
    current_next.prev = current_prev
    current_prev.next = current_next
  end

  def each(&prc)
    prc ||= Proc.new { |node| node.val }
    node = @head.next
    until node == @tail
      prc.call(node)
      node = node.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
