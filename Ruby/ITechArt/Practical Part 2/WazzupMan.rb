#!/usr/bin/env ruby

class Man
  private
  def method_missing(name, *args)
    result = "drink"
    3.times {if defined? fun
               result << fun
             else 
               super
             end}
    result
  end
end


p Man.new.drank
