module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |el| max = el if el > max }
        array.collect { |el| el != max && el.positive? ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if low > high

        middle = (low + high) / 2
        if array[middle] == query
          middle
        elsif query < array[middle]
          search(array, query, low, middle - 1)
        else
          search(array, query, middle + 1, high)
        end
      end
    end
  end
end
