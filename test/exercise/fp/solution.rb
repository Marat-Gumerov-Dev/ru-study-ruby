module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        count = array.map do |film|
          if !film['country'].nil? && film['country'].split(',').length > 1 && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive?
            film['rating_kinopoisk'].to_f
          end
        end.compact
        count.inject(:+) / count.length
      end

      def chars_count(films, threshold)
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
