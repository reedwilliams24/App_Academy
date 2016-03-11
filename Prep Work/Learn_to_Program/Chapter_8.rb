def sorted_list
  list = []

  input = gets.chomp
  while input != ""
    list.push(input)
    input = gets.chomp
  end

  list.sort!
  puts list.join(", ")

end

def table_of_contents
  line_width = 50
  table = ['Table of Contents', '', 'Chapter 1: Getting Started', 'page  1', 'Chapter 2: Numbers', 'page  9', 'Chapter 3: Letters', 'page 13']

  puts(table[0].center(line_width))
  puts(table[1])
  puts(table[2].ljust(line_width/2) + table[3].rjust(line_width/2))
  puts(table[4].ljust(line_width/2) + table[5].rjust(line_width/2+1))
  puts(table[6].ljust(line_width/2) + table[7].rjust(line_width/2+1))
end

#sorted_list
table_of_contents
