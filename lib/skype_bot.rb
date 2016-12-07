require 'typhoeus'

require 'skype_bot/card'
require 'skype_bot/activity'
require 'skype_bot/uri'
require 'skype_bot/auth'
require 'skype_bot/config'
require 'skype_bot/parser'
require 'skype_bot/version'

module SkypeBot
  extend self

  def configure
    yield(Config) if block_given?
  end

  def message(event, content)
    Activity.new(event).sent(content)
  end

  def card(event, format, payload)
    Card.call(event, format, payload)
  end

  def parser(data)
    Parser.new(data).execute
  end
end
