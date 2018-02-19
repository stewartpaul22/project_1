require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/user.rb' )

get '/users' do
  return "This is a test string for /users index"
end
