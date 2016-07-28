module SkypeBot
  module Cards
    class Carousel < Base

      def payload(attachments)
        {
          type: 'message',
          agent: 'botbuilder',
          source: 'skype',
          address: {
            channelId: 'skype',
            user: { id: uid },
            bot: { id: "#{Config.skype_number}:#{Config.app_id}" },
            serviceUrl: 'https://skype.botframework.com',
            useAuth: true
          },
          textFormat: 'xml',
          attachmentLayout: 'carousel',
          attachments: attachments
        }
      end

      def build_attachments(attachments)
        attachments.map { |attachment| { contentType: "application/vnd.microsoft.card.hero", content: attachment } }
      end
    end
  end
end
