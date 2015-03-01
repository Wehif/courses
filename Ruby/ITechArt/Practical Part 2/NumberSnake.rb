#!/usr/bin/env ruby

def snake(side)
  square = Array.new(side) {Array.new(side)}
  length, a_length, height, a_height = side-1 , 0, side-1, 0
  counter||=0
  loop do
    i, j = 0, 0
    i=a_height
    while i <= height # вниз
      square[i][length] = counter
      counter+=1; i+=1
    end
    break if a_length == length
    length-=1
    j = length
    while j >= a_length # влево
      square[height][j] = counter
      counter+=1; j-=1
    end
    break if a_height == height
    height-=1
    i = height
    while i >= a_height # вверх
      square[i][a_height] = counter
      counter+=1; i-=1
    end
    a_length+=1
    j = a_length
    while j <= length # вправо
      square[a_height][j] = counter
      counter+=1; j+=1
    end
    a_height+=1
    break if counter >= side**2
  end
  square
end

snake(6).each { |el| p el }

