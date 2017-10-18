require "ethermine_api/version"
require "ethermine_api/default_parser"
require "ethermine_api/connection"
require "ethermine_api/pool"
require "ethermine_api/worker"
require "ethermine_api/miner"

module EthermineApi
  def self.connection base_url='https://api.ethermine.org'
    Connection.new(base_url)
  end
end
