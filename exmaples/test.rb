begin
  require 'sinatra'
  require 'omniauth'
  require 'omniauth-bitbucket'
rescue LoadError
  require 'rubygems'
  require 'sinatra'
  require 'omniauth'
  require 'omniauth-bitbucket'
end

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :bitbucket, ENV['BITBUCKET_KEY'], ENV['BITBUCKET_PAIR']
end

get '/' do
  <<-HTML
    <a href='/auth/bitbucket'>Sign in with Bitbucket</a>
    HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  # do whatever you want with the information!
  puts auth.inspect
end
