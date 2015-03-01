#!/usr/bin/env ruby

module Ghost
  def self.boo;p "Boo"; end
  class <<self
    def hi; p "Hi!"; end
  end
  def bye; p "Bye!"; end
end

class First
include Ghost # Расширяет методами модуля экземляр класса
end

class Second
extend Ghost # Расширяет методами модуля сам класс
end

Ghost.respond_to?(:hi) ? (Ghost.hi) : (p "undefined method hi on Ghost");
Ghost.respond_to?(:boo) ? (Ghost.boo) : (p "undefined method boo on Ghost");
Ghost.respond_to?(:bye) ? (Ghost.bye) : (p "undefined method bye on Ghost");
p "_______________"

foo = First.new
foo.respond_to?(:hi) ? (foo.hi) : (p "undefined method hi on foo - object First");
foo.respond_to?(:boo) ? (foo.boo) : (p "undefined method boo on foo - object First");
foo.respond_to?(:bye) ? (foo.bye) : (p "undefined method bye on foo - object First");
p "_______________"

hoo = Second.new
hoo.respond_to?(:hi) ? (hoo.hi) : (p "undefined method hi on hoo - object Second");
hoo.respond_to?(:boo) ? (hoo.boo) : (p "undefined method boo on hoo - object Second");
hoo.respond_to?(:bye) ? (hoo.bye) : (p "undefined method bye on on hoo - object Second");
p "_______________"


First.respond_to?(:bye) ? (First.bye) : (p "undefined method bye on First");
Second.respond_to?(:bye) ? (Second.bye) : (p "undefined method bye on Second");
hoo.singleton_class.bye

