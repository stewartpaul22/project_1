require_relative('../db/sql_runner')

class User

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @net_monthly_income = options['net_monthly_income'].to_f
    @monthly_budget = options['monthly_budget'].to_f
  end

end
