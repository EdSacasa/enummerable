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
