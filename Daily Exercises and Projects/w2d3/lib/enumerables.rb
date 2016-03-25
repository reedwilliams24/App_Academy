require 'byebug'

class Array

  def unique
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el, i|
      self.each_with_index do |el2, j|
        if (i != j && el + el2 == 0) && !result.include?([j ,i])
          result << [i, j]
        end
      end
    end
    result
  end

  def my_transpose
    return [] if self.empty?
    result = Array.new(self[0].length) {Array.new}
    self.each do |row|
      row.each_with_index do |el, i|
        result[i] << el
      end
    end
    result
  end

  def stock_picker
    result = []
    return nil if self.empty?
    buy_index = nil
    sell_index = nil
    max = 0
    self.each_with_index do |buy_date, i|
      self.each_with_index do |sell_date, j|
        if sell_date - buy_date > max && j > i
          max = sell_date - buy_date
          buy_index = i
          sell_index = j
        end
      end
    end
    return [] if max == 0
    [buy_index, sell_index]
  end
  #   date = []
  #   max = 0
  #   return nil if self.empty?
  #   self.each_index do |i|
  #     (i + 1...self.length).each do |j|
  #       new_max = self[j] - self[i]
  #       if self[j] - self[i] > max
  #         date = [i, j]
  #         max = new_max
  #       end
  #     end
  #   end
  #   date
  # end
end
