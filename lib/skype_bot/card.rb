require 'skype_bot/cards/base'
require 'skype_bot/cards/hero'
require 'skype_bot/cards/carousel'
require 'skype_bot/cards/sign_in'

module SkypeBot
  module Card
    extend self

    def call(format, event, payload)
      Cards.const_get(format.to_s.classify).new(event).sent(payload)
    end
  end
end
