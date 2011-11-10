require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Bitbucket < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "Bitbucket"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => 'https://api.bitbucket.org',
        :request_token_path => '/1.0/oauth/request_token',
        :authorize_path     => '/1.0/oauth/authenticate',
        :access_token_path  => '/1.0/oauth/access_token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['username'] }

      info do
        {
          :name => "#{user_info['first_name']} #{user_info['last_name']}",
          :avatar => raw_info['avatar']
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/1.0/user')).body['user']
      end
    end
  end
end
