require_relative('../db/sql_runner')
require_relative('movie')
require_relative('casting')


class Star

  attr_accessor :first_name, :last_name, :id


  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'] if options['id']
  end


    def save()
        sql = "INSERT INTO stars
        (
        first_name,
        last_name
        ) VALUES
        (
        $1, $2
        )
        RETURNING id"
        values = [@first_name, @last_name]
        @id = SqlRunner.run( sql, values )[0]["id"].to_i()
      end

      def self.all()
        sql = "SELECT * FROM stars"
        values = []
        stars = SqlRunner.run(sql, values)
        result = stars.map { |star| Star.new( star ) }
        return result
      end

      def self.delete_all()
        sql = "DELETE FROM stars"
        values = []
        SqlRunner.run(sql, values)
      end

      def movies
        sql = "SELECT movies.* FROM movies INNER JOIN castings ON
              movies.id = castings.movie_id WHERE castings.star_id = $1"
        values = [@id]
        movies_hashes = SqlRunner.run(sql, values)
        return movies_hashes.map {|movie| Movie.new(movie)}
      end

end
