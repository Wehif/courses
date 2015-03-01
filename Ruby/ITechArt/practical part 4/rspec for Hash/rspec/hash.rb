#!/usr/bin/env ruby

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

