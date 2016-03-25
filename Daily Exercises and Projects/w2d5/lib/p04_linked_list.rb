class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList

  include Enumerable

  attr_reader :list

  def initialize
    @list = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @list.empty? ? nil : @list.first
  end

  def last
    @list.empty? ? nil : @list.last
  end

  def empty?
    @list.empty?
  end

  def get(key)
    @list.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    @list.any?{|link| link.key == key}
  end

  def insert(key, val)
    @list.each do |link|
      if link.key == key
        link.val = val
        return nil
      end
    end
    link = Link.new(key, val)
    link.prev = last
    last.next = link unless last.nil?
    @list << link
  end

  def remove(key)
    el = nil
    @list.each do |link|
      if link.key == key
        link.prev.next = link.next unless link.prev.nil?
        link.next.prev = link.prev unless link.next.nil?
        el = @list.delete(link)
      end
    end
    return el unless el.nil?
  end

  def each(&prc)
    i = 0
    until i == @list.length
      prc.call(@list[i])
      i += 1
    end
    self
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
