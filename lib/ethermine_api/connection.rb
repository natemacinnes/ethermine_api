require 'faraday'

module EthermineApi
  class Connection
    attr_accessor :base_url

    def initialize(base_url=nil)
      self.base_url = base_url || "https://api.ethermine.org"
    end

    def default_connection
      self.new
    end

    def call(endpoint)
      Faraday.get("#{self.base_url}/#{endpoint}")
    end
  end
end
