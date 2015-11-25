require 'sinatra'
require 'twitter'

twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['AUTH_TOKEN']
  config.access_token_secret = ENV['AUTH_SECRET']
end
  
configure do
  set :twitter, twitter
end

get '/:user' do
  content_type :json 
  {followers: settings.twitter.user(params[:user]).followers_count}.to_json
end