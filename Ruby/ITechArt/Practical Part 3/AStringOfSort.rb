#!/usr/bin/env ruby

def string_sort(string, order)
  any_chars=string.delete(order)
  order = order.chars.map { |char| char*string.count(char) }.join
  order << any_chars
end

p string_sort("myyyssstring", "myrk")
p string_sort("string", "gnirts")
p string_sort("foos", "of")
