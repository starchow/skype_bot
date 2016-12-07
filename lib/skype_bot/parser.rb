module SkypeBot
  class Parser
    attr_accessor :payload

    def initialize(data)
      @payload = data['skype']
    end

    def execute
      {
        id: payload['id'],
        type: payload['type'].underscore,
        from: payload['from']['id'],
        display_name: payload['from']['name'],
        to: payload['recipient']['id'],
        time: Time.parse(payload['timestamp']),
        content: payload['text'],
        service_url: payload['serviceUrl'],
        channel_id: payload['channelId'],
        conversation_id: payload['conversation']['id'],
        bot_name: payload['recipient']['name']
      }
    end
  end
end
