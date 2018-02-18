require_relative('../db/sql_runner')

class User

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @net_monthly_income = options['net_monthly_income'].to_f
    @monthly_budget = options['monthly_budget'].to_f
  end

  # add_user class method
    # create query string to insert/create user
    # create parameters to pass into the query string
    # execute the query using the sql_runner.rb run method
    # return the @id from the new db entry

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
