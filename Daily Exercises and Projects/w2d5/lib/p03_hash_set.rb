require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(item)
    item = item.hash
    resize! if @count == num_buckets
    @count += 1
    @store[item % num_buckets] << item
  end

  def remove(item)
    item = item.hash
    if @store[item % num_buckets].include?(item)
      @count -= 1
      @store[item % num_buckets].delete(item)
    end
  end

  def include?(item)
    item = item.hash
    @store[item % num_buckets].include?(item)
  end

  private

  def [](item)
    # optional but useful; return the bucket corresponding to `item`
  end

  def num_buckets
    @store.length
  end

  def resize!
    storage = []

    @store.each do |el|
      el.each do |item|
        storage << remove(item)
      end
    end

    num_buckets.times { @store << [] }

    storage.each do |el|
      insert(el)
    end
  end
end
