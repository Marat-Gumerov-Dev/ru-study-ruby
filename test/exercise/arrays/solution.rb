module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |el| max = el if el > max }
        array.collect { |el| el != max && el.positive? ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        # ИЗ КОММИТА 4 дня назад который был сделан в строчке ниже
        # КАК РАЗ ПРОВЕРЯЕТСЯ /if !(array & [query]).empty?/  
        # ЕСТЬ ЛИ ЭЛЕМЕНТ В МАССИВЕ? И ЕСЛИ ЕСТЬ ТОГДА return -1
        return -1 if !(array & [query]).empty? || low > high

        middle = (low + high) / 2
        return middle if array[middle] == query

        array[middle] > query ? search(array, query, low, middle - 1) : search(array, query, middle + 1, high)
      end
    end
  end
end
