module SkypeBot
  module Activity
    extend self

    CONVERSATION_URL = 'https://skype.botframework.com/v3/conversations'

    def text_message(uid, content)
      token = Auth.get_token
      body = payload(uid, content).to_json
      headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }
      url = activity_url(uid)

      Typhoeus.post(url, body: body, headers: headers)
    end

    private

    def activity_url(uid)
      "#{CONVERSATION_URL}/#{uid}/activities"
    end

    def payload(uid, content)
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
