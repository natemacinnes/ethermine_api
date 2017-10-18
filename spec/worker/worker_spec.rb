RSpec.describe EthermineApi::Worker do

  miner_address = "703a08bd7ee10d5f34950527ea957afd818e82a7"
  worker_address = "bitty-balls"

  it "gives back a list of workers for the specified miner" do
    VCR.use_cassette('minerWorkers') do
      all_workers = EthermineApi::Worker.all(miner_id: miner_address)
    end
  end

  it "gives back specified worker history for a specified miner" do
    VCR.use_cassette('minerWorkerHistory') do
      worker_history = EthermineApi::Worker.history(
        miner_id: miner_address, 
        id: worker_address
      )
    end
  end

  it "gives back specified worker statistics for a specified miner" do
    VCR.use_cassette('minerWorkerStatistics') do
      worker_stats = EthermineApi::Worker.stats(
        miner_id: miner_address,
        id: worker_address
      )
    end
  end
end
