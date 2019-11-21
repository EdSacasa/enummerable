module Enumerable
  def my_each
    index = 0
    while index < self.length
      yield(self[index])
      index += 1
    end
  end

  def my_each_with_index
    index = 0
    while index < self.length
      yield(self[index],index)
      index += 1
    end
  end

  def my_select
    new_arr = Array.new()
    self.my_each {|elem| new_arr << elem if yield(elem)}
    new_arr
  end

  def my_all?
    result = false
    self.my_each {|elem| yield(elem) ? result = true : result = false }
    result
  end

  def my_any?
    result = false
    self.my_each {|elem| result = true if yield(elem)}
    result
  end

  def my_none?
    result = true
    self.my_each {|elem| result = false if yield(elem)}
    result
  end

  def my_count num = nil
    count = 0
      if num
        self.my_each {|elem| count += 1 if elem == num}
      elsif block_given?
        self.my_each {|elem| count += 1 if yield(elem)}
      else
        count = self.length
      end
    count
  end

  def my_map block = nil
    new_arr = Array.new()
    if block
      self.my_each_with_index {|elem,index| new_arr[index] = block.call(elem)}
    else
      self.my_each_with_index {|elem,index| new_arr[index] = yield(elem)}
    end
    new_arr
  end

  def my_inject initial = nil
    initial == nil ? result = self[0] : result = initial

    for i in 1..self.length - 1
      result = yield(result,self[i])
    end
    result
  end
end
