require('date')

require_relative('../db/sql_runner')


class Transaction

  attr_reader :id
  attr_accessor :merchant_name, :amount, :transaction_date, :tag_id, :user_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @amount = options['amount'].to_f
    @transaction_date = Date.parse(options['transaction_date'])
    @tag_id = options['tag_id'].to_i
    @user_id = options['user_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (merchant_name, amount, transaction_date, tag_id, user_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@merchant_name, @amount, @transaction_date, @tag_id, @user_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET (merchant_name, amount, transaction_date, tag_id, user_id) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@merchant_name, @amount, @transaction_date, @tag_id, @user_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |transaction| Transaction.new( transaction ) }
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Transaction.new( results.first() )
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

end
