module SkypeBot
  class Parser
    attr_accessor :payload

    def initialize(data)
      @payload = data['skype']
    end

    def execute
      {
        type: payload['type'].underscore,
        from: payload['from']['id'],
        display_name: payload['from']['name'],
        to: payload['recipient']['id'],
        time: Time.parse(payload['timestamp']),
        content: payload['text']
      }
    end
  end
end
