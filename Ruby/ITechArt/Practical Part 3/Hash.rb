#!/usr/bin/env ruby

require 'benchmark'

class MyHash
  attr_accessor :bins, :bin_count

  def initialize
    @hash = Struct.new(:key, :value)
    self.bin_count = 213_213
    self.bins = []
  end

  def [](key)
    index = hash_function(key)
    return nil if self.bins[index] == nil
    self.bins[index].detect { |entry| entry.key == key }
  end

  def []= (key, value)
    entry = @hash.new(key, value)
    index = hash_function(entry.key)
    self.bins[index] ||= []
    self.bins[index] << entry
  end

  private
  def hash_function(key)
   key.hash % self.bin_count
  end
end

table = MyHash.new
array = []
hash = {}

(1..500_000).each { |i| table["#{i}"] = i; array << i; hash["#{i}"] = i }

#[test_0]
p "In MyHash"

%w(0 1 100_000 250_000 499_999).each { |key| time = Benchmark.realtime { table[key] }; p "Finding #{key} took #{time*1000} ms" }

p "In array"

%w(0 1 100_000 250_000 499_999).each { |key| time = Benchmark.realtime { array.index(key) }; p "Finding #{key} took #{time*1000} ms" }

p "In standart hash"

%w(0 1 100_000 250_000 499_999).each { |key| time = Benchmark.realtime { hash[key] }; p "Finding #{key} took #{time*1000} ms" }
