module Enumerable
  def my_each
    index = 0
    while index < self.size
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    while index < self.size
      yield(self[index], index)
      index += 1
    end
    self
  end


end

puts "my_each:"
[1,2,3].my_each {|num| puts "#{num}!"}
puts "each:"
[1,2,3].each {|num| puts "#{num}!"}
puts "my_each_with_index:"
[1,2,3].my_each_with_index {|num, i| puts "#{i+1}. #{num}!"}
puts "each_with_index:"
[1,2,3].each_with_index {|num, i| puts "#{i+1}. #{num}!"}
