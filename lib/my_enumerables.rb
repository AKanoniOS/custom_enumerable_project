module Enumerable
  # Your code goes here

  def my_all?                     # check to see if all elements in enumerable meet criteria
    i = 0                         # create iterator 
    x = true                      # create bool value
    while i < self.count          # iterate through entire enumerable object
      item = self[i]              # grab current iteration's value
      if yield(item) == false     # yield item to block and check if it returns false
        x = false                 # if it does, set bool value to false and
        i = self.count            # exit loop without checking any further values
      end                         #
      i += 1                      # increment iterator
    end                           #
    return x                      # return bool value
  end                             #

  def my_any?                     # check to see if any elements meet criteria
    i = 0                         # 
    x = false                     # create bool value with default value false
    while i < self.count          # 
      item = self[i]              #
      if yield(item)              # yield item to block, if block criteria is met, then
        x = true                  # set bool to true and
        i = self.count            # exit the loop without checking further values
      end                         #
      i += 1                      # increment iterator
    end                           #
    return x                      # return bool value
  end                             #

  def my_count                    #
    if block_given?               #
      i = 0                       #
      x = 0                       #
      while i < self.count        #
        item = self[i]            #
        if yield(item)            #
          x += 1                  #
        end                       #
        i += 1                    #
      end                         #
      return x                    #
    else                          #
      return self.size            #
    end                           #
  end                             #

  def my_each_with_index          #
    i = 0                         #
    while i < self.count          #
      item = self[i]              #
      index = i                   #
      yield(item, index)          #
      i += 1                      #
    end                           #
    return self                   #
  end                             #

  def my_inject(init_value = 0)   # create method and set initial value default to zero
    i = 0                         # create iterator
    total = init_value            # set total value to initial_value
    while i < self.count          # iterate through entire enumerable object
      item = self[i]              # grab current iteration's array value
      total = yield(item, total)  # yield the total and item to the block for it to do something, set it equal to total
      i += 1                      # increment the iterator
    end                           #
    return total                  # return total value
  end

  def my_map
    new_array = []   #create new empty array to push result to 
    i = 0    #create iterator variable
    while i < self.count   #loop over the entire array
      item = self[i]    #grab this specific iteration's value from the array 
      new_array.push(yield(item))    #do something to it with the code block and push the result to the new array
      i += 1    #increment the iterator
    end
    return new_array   #return the new array
  end

  def my_none?
    i = 0
    x = true
    while i < self.count
      item = self[i]
      if yield(item) == true    #one small change from my all method
        x = false
        i = self.count
      end
      i += 1
    end
    return x
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
