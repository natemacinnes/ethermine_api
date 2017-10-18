module EthermineApi
  class Worker
    class << self
      def all options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:miner_id]}/workers"
          )
        )
      end

      def history options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:miner_id]}/worker/#{options[:id]}/history"
          )
        )
      end

      def stats options={}
        DefaultParser.parse(
          EthermineApi.connection(options[:base_url]).call(
            "miner/#{options[:miner_id]}/worker/#{options[:id]}/currentStats"
          )
        )
      end
    end
  end
end
