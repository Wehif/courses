#!/usr/bin/env ruby

def disappeared(array)
  array.sort!
  missed = []
  i=0
  end_on_array= array[-1]
  while i < end_on_array
    i+=1
    if i != array[i-1]
      missed << i
      array = array.push(i).sort
    end
  end
  p missed
end

arr=(1..200).to_a
arr -= [ 5, 8, 13, 29, 185, 198, 100]
disappeared(arr)
