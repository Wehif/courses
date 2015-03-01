#!/usr/bin/env ruby

class Object
  def my_singleton_class
    class <<self
      self
    end
  end
end

a=Object.new
b=a.my_singleton_class
c=a.my_singleton_class
p b.object_id
p c.object_id
p Object.singleton_class === Object.my_singleton_class
