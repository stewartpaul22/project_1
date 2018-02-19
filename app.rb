require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/user_controller')
require_relative('controllers/transaction_controller')

require_relative( './models/user.rb' )
require_relative( './models/transaction.rb' )
require_relative( './models/tag.rb' )

get '/' do
  user = User.find(1)
  @total_spent = user.total_spent().round(2)
  @remaining_funds = user.budget_remaining().round(2)
  erb( :index )
end
