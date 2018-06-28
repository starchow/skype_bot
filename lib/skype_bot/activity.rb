module SkypeBot
  class Activity
    attr_accessor :event

    def initialize(event)
      @event = event
    end

    def sent(content)
      token = Auth.get_token
      body = payload(content).to_json
      headers = { Authorization: "Bearer #{token}", 'Content-Type': 'application/json' }
      Typhoeus.post(activity_url, body: body, headers: headers)
    end

    private

    def activity_url
      end_point = Uri.join(event['service_url'], Config.conversation_path, event['conversation_id'], Config.activity_path)

      if !(event['id'].nil? || event['id'].empty?) && event['channel_id'] != 'skype'
        end_point + '/' + event['id']
      else
        end_point
      end
    end

    def payload(content)
      {
        type: 'message',
        text: content,
        from: { id: event['to'], name: event['bot_name'] },
        recipient: { id: event['from'] }
      }
    end
  end
end
