require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/user.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/tag.rb' )

get '/transactions' do
  user = User.find(1)
  @total_spent = user.total_spent().round(2)
  @remaining_funds = user.budget_remaining().round(2)
  @transactions = user.all_transactions()
  erb( :"transactions/index" )
end

get '/transactions/new' do
  @tags = Tag.all()
  erb( :"transactions/new")
end

get '/transactions/tag' do
  user = User.find(1)
  @total_spent = user.total_spent().round(2)
  @remaining_funds = user.budget_remaining().round(2)
  @tags = Tag.all()
  @chosen_tag = @tags[(params[:tag_id].to_i) - 1]
  @total_spent_by_tag = user.total_spent_by_tag(params[:tag_id]).round(2)
  @transactions = user.all_transactions_by_tag(params[:tag_id])
  erb( :"transactions/tag")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :"transactions/create")
end
