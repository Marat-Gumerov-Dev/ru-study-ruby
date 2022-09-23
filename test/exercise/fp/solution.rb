module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        def terms?(film)
          true if !film['country'].nil? && !film['rating_kinopoisk'].nil? &&
                  film['country'].split(',').length > 1 && film['rating_kinopoisk'].to_f.positive?
        end

        filtered = array.collect do |film|
          terms?(film) ? film['rating_kinopoisk'].to_f : nil
        end.compact
        filtered.reduce(:+) / filtered.length
      end

      def chars_count(films, threshold)
        count = films.map do |film|
          (!film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold) ?
          film['name'].chars.select { |char| char == 'и' }.size :
          nil
        end.compact.inject(:+)
      end
    end
  end
end
