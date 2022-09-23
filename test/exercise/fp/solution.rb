module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered = array.reject { |film| film['country'].nil? }
                        .select { |film| film['country'].split(',').length > 1 }
                        .reject { |film| film['rating_kinopoisk'].nil? }
                        .select { |film| film['rating_kinopoisk'].to_f.positive? }
        result = filtered.map { |film| film['rating_kinopoisk'].to_f }
        result.reduce(:+) / result.length
      end

      def chars_count(films, threshold)
        filtered = films.reject { |film| film['rating_kinopoisk'].nil? }
                        .select { |film| film['rating_kinopoisk'].to_f >= threshold }
        count = films.map do |film|
          
          next unless !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold

          film['name'].chars.select do |char|
            char == 'и'
          end.length
        end.compact
        count.inject(:+)
      end
    end
  end
end
