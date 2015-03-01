#!/usr/bin/env ruby

def sherlock(*array)
  count_array = []
  array.flatten!
  array.uniq.each { |el| count_array << array.count(el) }
  if count_array.count(count_array.min) == 1
    array[count_array.find_index(count_array.min)]
  else
    nil
  end
end

p sherlock(5, 22, 10, 14, 14, 5, 10)
p sherlock(5, 22, 10, 14, 14, 5, 10, 22)
p sherlock(5, 22, 5, 14, 14, 5, 10, 22, 10)
