module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered = array.collect do |film|
          valid_film?(film) ? film['rating_kinopoisk'].to_f : nil
        end.compact
        filtered.reduce(:+) / filtered.length
      end

      def chars_count(films, threshold)
        films.map do |film|
          film['name'].chars.select { |char| char == 'и' }.size if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold
        end.compact.inject(:+)
      end

      private

      def valid_film?(film)
        !film['country'].nil? && !film['rating_kinopoisk'].nil? &&
          film['country'].split(',').length > 1 && film['rating_kinopoisk'].to_f.positive?
      end
    end
  end
end
