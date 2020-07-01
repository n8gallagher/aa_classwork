class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    g = 0
    self.each_with_index do |ele, idx|
      if idx.even?
        g += ele.to_s.length
      else
        g *= (ele.to_s.length + 1)
      end
    end
    g.hash
  end
end

class String
  def hash
    g = 0

    self.each_char.with_index do |char, idx|
      if idx.even?
        g *= char.ord
      else
        g -= (char.ord) + 5
      end
    end
    g.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    g = 0

    self.keys.sort.each do |k|
      v = self[k]
      val = v.is_a?(Integer) ? v : v.ord
      if val.even?
        g *= val
      else
        g -= (val) + 5
      end
    end
    g.hash
  end
end
