module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.to_enum unless block_given?
    self.length.times {|index| yield self[index]}
    self
  end
  
  def my_each_with_index
    return self.to_enum unless block_given?
    self.length.times {|index| yield self[index], index}
    self
  end

  
  def my_select
    result = []
    self.length.times {|index| result << self[index] if yield self[index]}
    result
  end
  
  def my_all? 
    result = false
    self.length.times {|index| result = yield self[index]}
    result
  end
  
  def my_any? 
    result = true
    self.length.times {|index| result = yield self[index]}
    result
  end
  
  def my_none? 
    result = []
    self.length.times {|index| result<<index if yield self[index]}
    result.length == 0
  end
  
  def my_count 
    return self.size unless block_given?
    result = []
    self.length.times {|index| result << index if yield self[index]}
    result.length
  end
  
  def my_map 
    result = []
    self.length.times {|index| result << yield(self[index])}
    result
  end
  
  def my_inject(result = nil)
    self.length.times do |index| 
      if result == nil && index == 0
        result = self[index]
        next
      end
        result = yield result, self[index]
    end
    result
  end

end
