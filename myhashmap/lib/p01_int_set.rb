class MaxIntSet
  attr_reader :max, :store
  
  def initialize(max)
    @max = max 
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return true if num < max && num >= 0 
    false
  end

  def validate!(num)
    
  end
end


class IntSet
  attr_accessor :store, :num_buckets
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :num_buckets, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      @count += 1
    end
    if @num_buckets == count 
      resize!
    end 
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count.times do 
      @store << Array.new 
    end 
    @num_buckets = num_buckets
    storage = []
    @store.each do |bucket|
      until bucket.empty?
        storage << bucket.pop
      end 
    end 
    storage.each do |value|
      self[value] << value  
    end
  end
end