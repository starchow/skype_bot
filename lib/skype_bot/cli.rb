require 'thor'

module SkypeBot
  class CLI < Thor
    require 'skype_bot'
    require 'skype_bot/version'
    require 'active_support/core_ext/hash/indifferent_access'

    class << self
      def exit_on_failure?
        true
      end

      def is_thor_reserved_word?(word, type)
        return false if word == 'message'
        super
      end
    end

    desc 'message', 'Send skype message to a conversation'

    method_option :'exit-code',
                  type: :boolean,
                  desc: 'Exits with non-zero code if there were any warnings/errors.'

    method_option :conversation_id,
                  type: :string,
                  default: '',
                  required: true,
                  aliases: '-c',
                  desc: 'Conversation Id (Example: 19:6bdf98504....9@thread.skype)'

    def message(content)
      SkypeBot::Config.app_id = ENV['SKYPE_APP_ID']
      SkypeBot::Config.app_secret = ENV['SKYPE_APP_SECRET']
      
      event = ActiveSupport::HashWithIndifferentAccess.new conversation_id: options[:conversation_id],
                service_url: 'https://smba.trafficmanager.net/apis'
                

      begin
        SkypeBot.message event, content
      rescue e
        p "Something wrong: #{e.message}"
      end

      p "Message is sent"

      if options[:'exit-code']
        error_messages_count = messages.count { |m| m.level != :info }
        exit(error_messages_count)
      end
    end

    desc 'version', 'Display version'
    map %w[-v --version] => :version

    def version
      puts Version::STRING
    end

    desc 'verbose-version', 'Display verbose version'
    map %w[-V --verbose-version] => :verbose_version

    def verbose_version
      puts Version.verbose
    end
  end
end