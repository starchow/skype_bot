module SkypeBot
  module Config

    mattr_accessor :bot_id
    mattr_accessor :app_id
    mattr_accessor :app_secret

    mattr_accessor :scope
    @@scope = 'https://graph.microsoft.com/.default'
  end
end
