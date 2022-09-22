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
        case array[middle] <=> query
        when 0
          middle
        when 1
          search(array, query, low, middle - 1)
        when -1
          search(array, query, middle + 1, high)
        end
      end
    end
  end
end
