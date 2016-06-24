module SkypeBot
  module Activity
    extend self

    CONVERSATION_URL = 'https://apis.skype.com/v2/conversations'

    def text_message(uid, content)
      token = Auth.get_token
      body = { message: { content: content } }.to_json
      headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }
      url = activity_url(uid)

      Typhoeus.post(url, body: body, headers: headers)
    end

    private

    def activity_url(uid)
      "#{CONVERSATION_URL}/#{uid}/activities"
    end
  end
end
