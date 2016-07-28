module SkypeBot
  module Cards
    class Hero < Base

      def build_attachments(attachment)
        [{
          contentType: "application/vnd.microsoft.card.hero",
          content: attachment
        }]
      end
    end
  end
end

# {:title=>"Hero Card", :subtitle=>"Space Needle", :text=> "The <b>Space Needle</b> is an observation tower in Seattle, Washington, a landmark of the Pacific Northwest, and an icon of Seattle.", :images=> [{:url=> "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Seattlenighttimequeenanne.jpg/320px-Seattlenighttimequeenanne.jpg"}], :buttons=> [{:type=>"openURL", :value=>"https://www.ring.md", :title=>"Current Weather"}]}
