module SkypeBot
  class Parser
    attr_accessor :payload

    def initialize(data)
      @payload = data['_json']
    end

    def execute
      payload.map do |event|
        {
          action: event['action'],
          type: event['activity'].underscore,
          from: event['from'],
          display_name: event['fromDisplayName'],
          to: event['to'],
          time: Time.parse(event['time']),
          content: event['content']
        }
      end
    end
  end
end