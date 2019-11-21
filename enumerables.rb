module Enumerable
    def my_each
      for i in 0...self.length
        yield(self[i])
      end
    end

    def my_each_with_index
        for i in 0...self.length
            yield(self[i], i)
        end
    end
    def my_select
      output = []
      my_each do |e|
        output << e if yield(e)
      end
      return output
    end

    def my_all?
      my_each do |e|
        return false unless yield(e)
      end
      true
    end
    def my_any?
      my_each do |e|
        return true if yield(e)
      end
      false
    end

    def my_none?
      return true unless block_given?

      my_each do |e|
        return true unless yield(e)
      end
      false
    end
    
    def my_count(obj = nil)
      count = 0
      my_each do |e|
        count += 1
        return count if obj && count == obj
        return count if block_given? && yield(e)
      end
      return count unless block_given?
    end
