module SkypeBot
  class Activity
    CONVERSATION_URL = 'https://skype.botframework.com/v3/conversations'

    attr_accessor :uid

    def initialize(uid)
      @uid = uid
    end

    def sent(content)
      token = Auth.get_token
      body = payload(content).to_json
      headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }

      Typhoeus.post(activity_url, body: body, headers: headers)
    end

    private

    def activity_url
      "#{CONVERSATION_URL}/#{uid}/activities"
    end

    def payload(content)
      {
        type: 'message',
        agent: 'botbuilder',
        source: 'skype',
        text: content,
        from: { id: "#{Config.skype_number}:#{Config.app_id}" },
        recipient: { id: uid },
        channelData: {}
      }
    end
  end
end
