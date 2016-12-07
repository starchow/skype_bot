module SkypeBot
  module Uri
    module_function

    def join(*parts)
      parts.join('/').gsub(/(?<!\:\/)\/(?!\/)/, '/')
    end
  end
end
