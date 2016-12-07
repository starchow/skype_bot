module SkypeBot
  module Cards
    class Base
      attr_accessor :event

      def initialize(event)
        @event = event
      end

      def sent(data)
        token = Auth.get_token
        attachments = build_attachments(data)
        body = payload(attachments).to_json
        headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }

        Typhoeus.post(activity_url, body: body, headers: headers)
      end

      def activity_url
        end_point = Uri.join(event['service_url'], Config.conversation_path, event['conversation_id'], Config.activity_path)

        if event['id'].present? && event['channel_id'] != 'skype'
          end_point + '/' + event['id']
        else
          end_point
        end
      end

      def payload(attachments)
        {
          type: 'message',
          from: { id: event['to'], name: event['bot_name'] },
          recipient: { id: event['from'] },
          textFormat: 'xml',
          attachments: attachments
        }
      end
    end
  end
end
