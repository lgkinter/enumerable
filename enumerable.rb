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

  def my_select
    select_arr = []
    self.my_each {|num| select_arr.push(num) if yield(num) }
    select_arr
  end

  def my_all?
    self.my_each { |num| yield(num) ? next : (return false) }
    return true
  end

  def my_any?
    self.my_each {|num| yield(num) ? (return true) : next }
    return false
  end

  def my_none?
    self.my_each {|num| yield(num) ? (return false) : next }
    return true
  end

  def my_count(value = nil)
    count = 0
    if block_given?
      self.my_each {|num| count += 1 if yield(num)}
    elsif value.nil?
      count = self.size
    else
      self.my_each {|num| count += 1 if num == value}
    end
    count
  end

  def my_map
    map_arr = []
    self.my_each {|num| map_arr.push(yield(num))}
    map_arr
  end

  def my_inject(value = nil)
    accumulator = value ||= 0
    self.my_each {|num| accumulator = yield(accumulator, num)}
    accumulator
  end

end

def multiply_els(multiply_arr)
  multiply_arr.my_inject(1) {|product, num| product * num}
end

puts "my_each:"
[1,2,3].my_each {|num| puts "#{num}!"}
puts "each:"
[1,2,3].each {|num| puts "#{num}!"}
puts "my_each_with_index:"
[1,2,3].my_each_with_index {|num, i| puts "#{i+1}. #{num}!"}
puts "each_with_index:"
[1,2,3].each_with_index {|num, i| puts "#{i+1}. #{num}!"}
puts "my_select:"
p [1,2,3].my_select {|num| num < 2}
puts "select:"
p [1,2,3].select {|num| num < 2}
puts "my_all?:"
p [1,2,3].my_all?{|num| num > 0}
puts "all?:"
p [1,2,3].all?{|num| num > 0}
puts "my_any?:"
p [1,2,3].my_any?{|num| num > 3}
puts "any?:"
p [1,2,3].any?{|num| num > 3}
puts "my_none?:"
p [1,2,3].my_none?{|num| num > 3}
puts "none?:"
p [1,2,3].none?{|num| num > 3}
puts "my_count:"
p [1,2,3].my_count
p [1,2,3].my_count(2)
p [1,2,3].my_count{|num| num % 2 == 0}
puts "count:"
p [1,2,3].count
p [1,2,3].count(2)
p [1,2,3].count{|num| num % 2 == 0}
puts "my_map:"
p [1,2,3].my_map{|num| num ** 2}
puts "map:"
p [1,2,3].map{|num| num ** 2}
puts "my_inject:"
p [1,2,3].my_inject(4){|sum, num| sum + num}
puts "inject:"
p [1,2,3].inject(4){|sum, num| sum + num}
puts "multiply_els:"
p multiply_els([2,4,5])
