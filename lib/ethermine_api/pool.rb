module EthermineApi
  class Pool
    class << self
      def pool_stats options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call("poolStats")
        )
      end

      def credits options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call("credits")
        )
      end

      def blocks_history options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call("blocks/history")
        )
      end

      def network_stats options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call("networkStats")
        )
      end

      def servers_history options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call("servers/history")
        )
      end
    end
  end
end
