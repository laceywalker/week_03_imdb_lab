require_relative('../db/sql_runner')
require_relative('star')


class Movie

  attr_accessor :title, :genre, :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end


  def save()
      sql = "INSERT INTO movies
      (
      title,
      genre
      ) VALUES
      (
      $1, $2
      )
      RETURNING id"
      values = [@title, @genre]
      @id = SqlRunner.run( sql, values )[0]["id"].to_i()
    end


    def self.all()
      sql = "SELECT * FROM movies"
      values = []
      movies = SqlRunner.run(sql, values)
      result = movies.map { |movie| Movie.new( movie) }
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM movies"
      values = []
      SqlRunner.run(sql, values)
    end

    def stars
      sql = "SELECT stars.* FROM stars INNER JOIN castings ON
            stars.id = castings.star_id WHERE castings.movie_id = $1"
      values = [@id]
      star_hashes = SqlRunner.run(sql, values)
      return star_hashes.map {|star| Star.new(star)}
    end

end
