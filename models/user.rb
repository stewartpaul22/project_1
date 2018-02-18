require_relative('../db/sql_runner')

class User

  attr_reader :id, :name, :net_monthly_income, :monthly_budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @net_monthly_income = options['net_monthly_income']
    @monthly_budget = options['monthly_budget']
  end

  def save()
    sql = "INSERT INTO users (name, net_monthly_income, monthly_budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @net_monthly_income, @monthly_budget]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  # delete_all_users instance method
  # create query string to delete user
  # create parameters to pass into the query string
  # execute the query using the sql_runner.rb run method

  # update_user instance method
    # create query string to update user
    # create parameters to pass into the query string
    # execute the query using the sql_runner.rb run method

  # return all users class method
    # create query string to return all users
    # create parameters to pass into the query string
    # return array of hases by executing the query using the sql_runner.rb run method
    # use the map() method to convert to an array of User objects

  # delete_user instance method
    # create query string to delete user
    # create parameters to pass into the query string
    # execute the query using the sql_runner.rb run method

  # return all_transactions instance method
    # create query string to return all transactions
    # create parameters to pass into the query string
    # return array of hases by executing the query using the sql_runner.rb run method
    # use the map() method to convert to an array of transaction objects

  # return all_transactions_by_month instance method
    # create query string to return all transactions by month
    # create parameters to pass into the query string
    # return array of hases by executing the query using the sql_runner.rb run method
    # use the map() method to convert to an array of transaction objects

  # return all_transactions_by_tag instance method
    # create query string to return all transactions by tag
    # create parameters to pass into the query string
    # return array of hases by executing the query using the sql_runner.rb run method
    # use the map() method to convert to an array of transaction objects

  # return total_spend instance method
    # call all_transactions method
    # sum() all transactions
    # return sum

  # return total_spend_by_month instance method
    # call all_transactions_by_month
    # sum() all transactions
    # return sum



end
