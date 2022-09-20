module Exercise
  module Arrays
    class << self
      def replace(array)
        max = max_of(array)
        array.collect { |el| el != max && el.positive? ? max : el }
      end

      def search(array, query)
        low = 0
        high = array.size - 1
        binary_search(array, low, high, query)
      end

          private

      def max_of(array)
        max = array[0]
        array.each do |el|
          max = el if el > max
        end
        max
      end

      def binary_search(array, low, high, query)
        if low <= high
          middle = (low + high) / 2
          if array[middle] == query
            middle
          elsif query < array[middle]
            binary_search(array, low, middle - 1, query)
          else
            binary_search(array, middle + 1, high, query)
          end
        else
          -1
        end
      end
        end
  end
end
