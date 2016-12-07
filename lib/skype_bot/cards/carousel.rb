module SkypeBot
  module Cards
    class Carousel < Base

      def payload(attachments)
        {
          type: 'message',
          from: { id: event['to'], name: event['bot_name'] },
          recipient: { id: event['from'] },
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
