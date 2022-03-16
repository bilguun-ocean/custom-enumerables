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
  
    selected = []
    for i in self
      selected.push i if yield i
    end
    selected
  end
  

  def my_all?
    return to_enum(:my_all?) unless block_given?
    result = true

    for i in self
      result = false unless yield i
    end
    result
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    result = false

    for i in self
      result = true if yield i
    end
    result
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    result = true

    for i in self
      result = false if yield i
    end
    result
  end

  def my_count
    return to_enum(:my_count) unless block_given?
    count = 0

    for i in self
      count += 1 if yield i
    end
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    map = []

    for i in self
      map.push(yield i)
    end
    map
  end

  def my_inject(initial = 0)
    return to_enum(:my_inject) unless block_given?
    total = initial

    for i in self
      total = yield total, i
    end
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
