require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/user.rb' )

get '/users' do
  erb(:"users/index")
end
