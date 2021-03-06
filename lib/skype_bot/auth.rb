module SkypeBot
  module Auth
    extend self

    OAUTH_URL = 'https://login.microsoftonline.com/botframework.com/oauth2/v2.0/token'

    # NOTE: minus 5 seconds to prevent token expire
    def get_token
      if @token && @valid_until && @valid_until > Time.now + 10
        @token
      else
        renew_token
      end
    end

    def renew_token
      response = Typhoeus.post(OAUTH_URL, body: auth_params)
      response_body = JSON.parse(response.body)

      @valid_until = Time.now + response_body['expires_in']
      @token = response_body['access_token']
    end

    private

    def auth_params
      {
        client_id: Config.app_id,
        client_secret: Config.app_secret,
        grant_type: 'client_credentials',
        scope: Config.scope
      }
    end
  end
end
