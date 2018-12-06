require_relative('star')
require_relative('movie')
require_relative('../db/sql_runner')


class Casting

    attr_accessor :movie_id, :star_id, :fee, :id

  def initialize(options)
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
    @id = options['id'].to_i if options['id']
  end

  def save()
      sql = "INSERT INTO castings
      (
      movie_id,
      star_id,
      fee
      ) VALUES
      (
      $1, $2, $3
      )
      RETURNING id"
      values = [@movie_id, @star_id, @fee]
      @id = SqlRunner.run( sql, values )[0]["id"].to_i()
    end

    def self.delete_all()
      sql = "DELETE FROM castings"
      values = []
      SqlRunner.run(sql, values)
    end





end
