require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hashed_key = key.hash
    @store[hashed_key % num_buckets].include?(key)
  end

  def set(key, val)
    hashed_key = key.hash
    resize! if @count == num_buckets
    @count += 1
    @store[hashed_key % num_buckets].insert(key, val)
  end

  def get(key)
    hashed_key = key.hash
    @store[hashed_key % num_buckets].get(key)
  end

  def delete(key)
    hashed_key = key.hash

    if @store[hashed_key % num_buckets].include?(key)
      @count -= 1
      @store[hashed_key % num_buckets].remove(key)
    end

  end

  def each

  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    storage = []

    @store.each do |list|
      list.each do |link|
        storage << link
      end
    end

    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    storage.each do |link|
      set(link.key, link.val)
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
