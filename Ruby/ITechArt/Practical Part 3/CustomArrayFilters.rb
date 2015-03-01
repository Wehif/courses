#!/usr/bin/env ruby

class Array
  def delete_nofix
    delete_if { |el| el.class.name != "Fixnum" && el.class.name != "Bignum" }
  end

  def even
    delete_nofix
    delete_if { |el| el.odd? }
  end

  def odd
    delete_nofix
    delete_if { |el| el.even? }
  end

  def under(arg)
    delete_nofix
    delete_if { |el| el >= arg }
  end

  def over(arg)
    delete_nofix
    delete_if { |el| el < arg }
  end

  def in_range(range)
    delete_nofix
    delete_if { |el| !range.include?(el) }
  end
end


p (1..100).to_a.odd
p (1..100).to_a.even

p (1..100).to_a.under(10)
p (1..100).to_a.over(90)

p (1..100).to_a.in_range(1..20)
