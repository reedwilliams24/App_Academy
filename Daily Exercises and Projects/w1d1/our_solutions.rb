class Array
  def my_each(&blk)
    ind = 0
    while ind < self.length
      blk.call(self[ind])
      ind += 1
    end
    self
  end

  def my_select(&blk)
    ret_arr = []
    self.my_each do |el|
      ret_arr << el if blk.call(el)
    end
    ret_arr
  end

  def my_reject(&blk)
    ret_arr = []
    self.my_each do |el|
      ret_arr << el unless blk.call(el)
    end
    ret_arr
  end

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    self.my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  def my_flatten
    ret_arr = []
    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each { |elm| ret_arr << elm}
      else
        ret_arr << el
      end
    end
    ret_arr
  end

  def my_zip(*args)
    idx = 0
    ret_arr = Array.new(self.length) { Array.new(args.length+1)}
    self.my_each do |el|
      idx2 = 0
      arr2 = []
      arr2 << el
      args.my_each { |elm| arr2 << elm[idx]}
      #ret_arr[idx].my_each do |elm|
      while idx2 < args.length + 1
        ret_arr[idx][idx2] = arr2[idx2]
        idx2+=1
      end
      idx+=1
    end
    ret_arr
  end

  def my_rotate(num = 1)
    rotated = []
    self.my_each {|el| rotated << el}
    if num < 0
      (-num).times {rotated.insert(0,rotated.pop)}
    else
      num.times {rotated << rotated.shift}
    end
    rotated
  end

  def my_join(str = "")
    ret_str = ""
    self.my_each {|el| ret_str << el + str}
    ret_str.chop! unless str == ""
    ret_str
  end

  def my_reverse
    ind = self.length - 1
    ret_arr = []
    while ind >= 0
      ret_arr << self[ind]
      ind -= 1
    end
    ret_arr
  end
end
