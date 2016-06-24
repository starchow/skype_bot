require 'typhoeus'

require 'skype_bot/activity'
require 'skype_bot/auth'
require 'skype_bot/config'
require 'skype_bot/version'

module SkypeBot
  extend self

  def configure
    yield(Config) if block_given?
  end
end
