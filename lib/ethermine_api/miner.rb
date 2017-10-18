module EthermineApi
  class Miner
    class << self
      def rounds options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:id]}/rounds"
          )
        )
      end

      def payouts options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:id]}/payouts"
          )
        )
      end

      def history options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:id]}/history"
          )
        )
      end

      def stats options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:id]}/currentStats"
          )
        )
      end

      def settings options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:id]}/settings"
          )
        )
      end
    end
  end
end
