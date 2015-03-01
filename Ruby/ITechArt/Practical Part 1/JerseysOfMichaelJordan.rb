#!/usr/bin/env ruby

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

def jerseys_sum(*args)
  sum||=0; args.flatten.each{|el| sum+=el.to_i if el.numeric?}; puts sum
end

jerseys_sum(ARGV)


