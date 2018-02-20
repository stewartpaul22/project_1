require_relative('../db/sql_runner')

class User

  attr_reader :id
  attr_accessor :name, :net_monthly_income, :monthly_budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @net_monthly_income = options['net_monthly_income']
    @monthly_budget = options['monthly_budget'].to_f
  end

  def save()
    sql = "INSERT INTO users (name, net_monthly_income, monthly_budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @net_monthly_income, @monthly_budget]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE users SET (name, net_monthly_income, monthly_budget) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @net_monthly_income, @monthly_budget, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM users"
    results = SqlRunner.run( sql )
    return results.map { |user| User.new( user ) }
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return User.new( results.first() )
    # should there be an way to handle nil values if id is nil?
  end

  def self.delete(id)
    sql = "DELETE FROM users WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run( sql )
  end

  def all_transactions()
    sql = "SELECT * FROM transactions WHERE user_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |transaction| Transaction.new( transaction )}
  end

  def all_transactions_by_tag(tag_id)
    sql = "SELECT * FROM transactions WHERE (user_id = $1 AND tag_id = $2)"
    values = [@id, tag_id]
    results = SqlRunner.run( sql, values )
    return results.map { |transaction| Transaction.new( transaction )}
  end

  def total_spent()
    transactions = all_transactions()
    total = 0
    transactions.each { |transaction| total += transaction.amount }
    return total.to_f
  end

  def budget_remaining()
    total_spent = total_spent()
    return (@monthly_budget -= total_spent)
  end

  def total_spent_by_tag(tag_id)
    transactions = all_transactions_by_tag(tag_id)
    total = 0
    transactions.each { |transaction| total += transaction.amount }
    return total.to_f
  end
  # ******* EXTENSIONS *********
  def all_transactions_by_month(month)
    sql = "SELECT * FROM transactions WHERE date_part('month', transaction_date) = $1"
    values = [month]
    results = SqlRunner.run( sql, values )
    return results.map { |transaction| Transaction.new( transaction )}
  end

  def total_spent_by_month(month)
    transactions = all_transactions_by_month(month)
    total = 0
    transactions.each { |transaction| total += transaction.amount }
    return total.to_f
  end



end
