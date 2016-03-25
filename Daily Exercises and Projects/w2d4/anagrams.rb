def anagram?(word1, word2)
  perms = word1.split("").permutation.to_a.map(&:join)
  perms.include?(word2)
end

#p anagram?("gizmo", "sally")    #=> false
#p anagram?("elvis", "lives")    #=> true


def second_anagram?(word1,word2)
  copy = word1.dup
  word1.split('').each_with_index do |v,i|
    word2.delete!(v) if word2.count(v) == word1.count(v)
    copy.delete!(v)

    #word2.delete(v) if word2.count(v) == word1.count(v)
    # word2.slice!(word2.index(v)) unless word2.index(v).nil?
    # copy.slice!(word2.index(v)) unless word2.index(v).nil?
  end
  word2 == copy && copy == ""
end


#p second_anagram?("gizmo", "sally")    #=> false
#p second_anagram?("elvis", "lives")

def third_anagram?(word1, word2)
  word1.split("").sort.join("") == word2.split("").sort.join("")
end


def fourth_anagram?(word1,word2)

  h = Hash.new(0)
  h2 = Hash.new(0)
  word1.split('').each_with_index do |v,i|
    h[v] = word1.count(v)
  end

    word2.split('').each_with_index do |v2,i2|
      h2[v2] = word2.count(v2)
    end

    h == h2

end



def bonus_fourth_anagram?(word1,word2)
  h = Hash.new {|h,v| h[v] = [0,0]}
  word1.split('').each_with_index do |v,i|
    h[v][0] += word1.count(v)
  end

    word2.split('').each_with_index do |v2,i2|
      h[v2][1] += word2.count(v2)
    end

    h.select {|k,v| v[0] == v[1]} == h

end


p bonus_fourth_anagram?("gizmo","sally")
p bonus_fourth_anagram?("elvis","lives")
