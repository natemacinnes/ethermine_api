require 'json'

module EthermineApi
  class DefaultParser
    class << self
      def parse response
        j_response = JSON.parse(response.body, object_class: OpenStruct)
        OpenStruct.new(j_response)
      end
    end
  end
end
