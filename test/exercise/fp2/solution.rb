module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if size.zero?

        block.call(first)
        MyArray.new(self[1...size]).my_each(&block)
        self
      end

      def my_map(&block)
        MyArray.new(my_reduce([]) { |acc, element| acc << block.call(element) })
      end

      # Написать свою функцию my_compact
      def my_compact
        MyArray.new(my_reduce([]) { |acc, el| el.nil? ? acc : acc << el })
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
