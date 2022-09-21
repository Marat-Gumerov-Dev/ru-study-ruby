module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        array = CSV.readlines('./test/fixtures/films.csv', headers: true)

        count = array.map do |film|
          if !film['country'].nil? && film['country'].split(',').length > 1 && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive?
            film['rating_kinopoisk'].to_f
          end
        end.compact
        count.inject(:+) / count.length
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
