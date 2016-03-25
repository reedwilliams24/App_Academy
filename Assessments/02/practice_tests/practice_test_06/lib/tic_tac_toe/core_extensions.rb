class Array
  def all_empty?
    self.each do |el|
      if el.is_a?(String) || el.is_a?(Array)
        return false if el.length > 0
      else
        return false
      end
    end
    true
  end

  def all_same?
    return true if self.all_empty?
    element = self[0]

    self.each do |el|
      return false if el != element
    end

    true
  end

  def any_empty?
    self.each do |el|
      if el.is_a?(String) || el.is_a?(Array)
        return true if el.length == 0
      end
    end
    false
  end

  def none_empty?
    self.each do |el|
      if el.is_a?(String) || el.is_a?(Array)
        return false if el.length == 0
      else
        return false
      end
    end
    true
  end
end
