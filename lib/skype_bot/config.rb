module SkypeBot
  module Config

    mattr_accessor :bot_id
    mattr_accessor :app_id
    mattr_accessor :app_secret
    mattr_accessor :skype_number

    mattr_accessor :scope
    @@scope = 'https://graph.microsoft.com/.default'

    mattr_accessor :conversation_path
    @@conversation_path = '/v3/conversations'

    mattr_accessor :activity_path
    @@activity_path = '/activities'
  end
end
