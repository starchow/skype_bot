module SkypeBot
  module Cards
    class Base
      CONVERSATION_URL = 'https://skype.botframework.com/v3/conversations'

      attr_accessor :uid

      def initialize(uid)
        @uid = uid
      end

      def sent(data)
        token = Auth.get_token
        attachments = build_attachments(data)
        body = payload(attachments).to_json
        headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }

        Typhoeus.post(activity_url, body: body, headers: headers)
      end

      def activity_url
        "#{CONVERSATION_URL}/#{uid}/activities"
      end

      def payload(attachments)
        {
          type: 'message',
          agent: 'botbuilder',
          source: 'skype',
          address: {
            channelId: 'skype',
            user: { id: uid },
            bot: { id: "#{Config.skype_number}:#{Config.app_id}" },
            serviceUrl: 'https://skype.botframework.com',
            useAuth: true
          },
          textFormat: 'xml',
          attachments: attachments
        }
      end
    end
  end
end
