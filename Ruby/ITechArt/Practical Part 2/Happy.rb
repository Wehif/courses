#!/usr/bin/env ruby

def happy(number)
  numbers = number.to_s.split("").map { |el| el.to_i }
  sum = 0
  numbers.each { |number| number=number**2; sum+=number}
  happy(sum) if sum != 1
  return true
  rescue SystemStackError
    false
end

p (1..100).each { |num| p "#{num}: " + "#{happy(num)}" }
