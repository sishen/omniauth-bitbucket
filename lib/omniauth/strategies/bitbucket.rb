require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Bitbucket < OmniAuth::Strategies::OAuth
      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => 'https://bitbucket.org',
        :request_token_path => '/api/1.0/oauth/request_token',
        :authorize_path     => '/api/1.0/oauth/authenticate',
        :access_token_path  => '/api/1.0/oauth/access_token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['username'] }

      info do
        {
          :name => "#{raw_info['first_name']} #{raw_info['last_name']}",
          :avatar => raw_info['avatar'],
          :email => raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= begin
                        ri = MultiJson.decode(access_token.get('/api/1.0/user').body)['user']
                        email = MultiJson.decode(access_token.get('/api/1.0/emails').body).find { |email| email['primary'] }
                        ri.merge!('email' => email['email']) if email
                        ri
                      end
      end
    end
  end
end
