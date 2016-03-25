require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

# class Array
#   def hash
#     # base = 348756
#     base = self.length + self.class.to_s.length
#     self.each_with_index do |el, idx|
#       if el.is_a?(Array)
#         el.empty? ? base += base * 3 : base += el.hash
#       else
#         base += (el.ord * base * (idx+1))
#       end
#     end
#     base
#   end
# end
#
# class String
#   def hash
#     self.chars.hash
#   end
# end
#
# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     self.keys.map(&:to_s).sort.hash
#   end
# end
