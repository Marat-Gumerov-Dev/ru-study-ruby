module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |el| max = el if el > max }
        array.collect { |el| el != max && el.positive? ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        mid = low + ((high - low) / 2)
        return - 1 if high < low
        return mid if array[mid] == query

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
