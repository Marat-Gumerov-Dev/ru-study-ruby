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
        count = films.map do |film|
          film['name'].chars.select { |char| char == 'и' }.size if film['rating_kinopoisk'].nil? &&
                                                                   film['rating_kinopoisk'].to_f >= threshold
        end.compact
        count.inject(:+)
      end
    end
  end
end
