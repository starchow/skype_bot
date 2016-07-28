module SkypeBot
  module Cards
    class SignIn < Base

      def build_attachments(data)
        [{
          contentType: 'application/vnd.microsoft.card.signin',
          content: {
            text: data[:title],
            buttons: [{
              type: 'signin',
              title: data[:title],
              value: data[:url]
            }]
          }
        }]
      end
    end
  end
end
