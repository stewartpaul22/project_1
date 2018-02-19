require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/user.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/tag.rb' )

get '/transactions' do
  user = User.find(1)
  @total_spent = user.total_spent()
  @remaining_funds = user.budget_remaining()
  @transactions = user.all_transactions()
  erb( :"transactions/index" )
end
