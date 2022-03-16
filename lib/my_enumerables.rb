module Enumerable
  
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
  
    index = 0
    for i in self
      yield i, index
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected = self.is_a?(Hash) ? {} : []

    my_each { |element| selected << element if yield element }
    selected
  end
  

  def my_all?
    return to_enum(:my_all?) unless block_given?
    result = true

    my_each { |element| result = false unless yield element }
    result
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    result = false

    my_each {|element| result = true if yield element }
    result
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    result = true

    my_each {|element| result = false if yield element }
    result
  end

  def my_count
    return to_enum(:my_count) unless block_given?
    count = 0

    my_each {|element| count += 1 if yield element }
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    map = self.is_a?(Hash) ? {} : []

    my_each {|element| map.push yield element }
    map
  end

  def my_inject(initial = 0)
    return to_enum(:my_inject) unless block_given?
    total = initial

    my_each {|element| total = yield(total, element)}
    total
  end

end


# Your code goes here

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in self
      yield i
    end
  end
end
