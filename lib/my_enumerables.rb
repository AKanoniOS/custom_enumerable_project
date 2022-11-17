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
