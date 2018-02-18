require_relative('../db/sql_runner')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @category = options['category']
  end

  def save()
    sql = "INSERT INTO tags (category) VALUES ($1) RETURNING id"
    values = [@category]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET category = $1 WHERE id = $2"
    values = [@category, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run( sql )
    return results.map { |tag| Tag.new( tag ) }
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first() )
    # should there be an way to handle nil values if id is nil?
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end

end
