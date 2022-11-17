module Enumerable
  # Your code goes here

  def my_all?

    i = 0
    x = true

    while i < self.count

      item = self[i]

      if yield(item) == false
        x = false
        i = self.count
      end

      i += 1
    
    end
        
    return x

  end

  def my_any?
    
    i = 0
    x = false

    while i < self.count

      item = self[i]
      
      if yield(item)
        x = true
        i = self.count
      else
        x = false
      end

      i += 1

    end

    return x

  end

  def my_count
    if block_given?
      i = 0
      x = 0
      
      while i < self.count
        item = self[i]
        if yield(item)
          x += 1
        end
        i += 1
      end

      return x
    else
      return self.size
    end
  end

  def my_each_with_index
    i = 0
    while i < self.count
      item = self[i]
      index = i
      yield(item, index)
      i += 1
    end
    return self
  end

  def my_inject
    
  end

  def my_map
    new_array = []
    i = 0
    while i < self.count
      item = self[i]
      new_array.push(yield(item))
      i += 1
    end
    return new_array
  end

  def my_none?

  end

  def my_select

  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      while i < self.count
        item = self[i]
        yield(item)
        i += 1
      end
    end
    return self
  end

  # [1,2,3].my_each {|item| puts item + 2}

end
