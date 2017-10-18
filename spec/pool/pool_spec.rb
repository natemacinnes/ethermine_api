RSpec.describe EthermineApi::Pool do
  it "gives back basic pool stats" do
    VCR.use_cassette('poolStats') do
      pool_stats = EthermineApi::Pool.stats
      expect(pool_stats).not_to be nil
      expect(pool_stats.status).to eq "OK"

      # Mined Blocks
      expect(pool_stats.data.minedBlocks).not_to be nil
      expect(pool_stats.data.minedBlocks.class).to be Array
      expect(pool_stats.data.minedBlocks.count).to be 10
      expect(pool_stats.data.minedBlocks.first).not_to be nil
      expect(pool_stats.data.minedBlocks.first.number).to be 4368733
      expect(pool_stats.data.minedBlocks.first.miner).to eq "a564fb0e9955c078de73dd087ae9ac92fcbc37af"
      expect(pool_stats.data.minedBlocks.first.time).to be 1508093566

      # Top Miners
      expect(pool_stats.data.topMiners).not_to be nil
      expect(pool_stats.data.topMiners.class).to be Array
      expect(pool_stats.data.topMiners.first).not_to be nil
      expect(pool_stats.data.topMiners.first.miner).to eq "f1b3e00955d7cbcde70f4337e333cd84da3a1c36"
      expect(pool_stats.data.topMiners.first.hashRate).to be 336530666666.6667

      # Pool Stats
      expect(pool_stats.data.poolStats).not_to be nil
      expect(pool_stats.data.poolStats.hashRate).to be 26477276722223.74
      expect(pool_stats.data.poolStats.miners).to be 62918
      expect(pool_stats.data.poolStats.workers).to be 212810
      expect(pool_stats.data.poolStats.blocksPerHour).to be 30.54

      # Price
      expect(pool_stats.data.price).not_to be nil
      expect(pool_stats.data.price.usd).to be 328.18
      expect(pool_stats.data.price.btc).to be 0.05952
    end
  end

  it "gives back credit list for ethpool" do
    VCR.use_cassette('poolCredits') do
      credits = EthermineApi::Pool.credits
      expect(credits).not_to be nil
      expect(credits.status).to eq "OK"
    end
  end

  it "gives back pool blocks history" do
    VCR.use_cassette('poolBlocksHistory') do
      blocks_history = EthermineApi::Pool.blocks_history
      expect(blocks_history).not_to be nil
      expect(blocks_history.status).to eq "OK"
      expect(blocks_history.data.class).to be Array
      expect(blocks_history.data.count).to eq 25
      expect(blocks_history.data.first.time).to eq 1508173116
      expect(blocks_history.data.first.nbrBlocks).to eq 6
      expect(blocks_history.data.first.difficulty).to eq 1500851769972565
    end
  end

  it "gives back pool network statistics" do
    VCR.use_cassette('poolNetworkStatistics') do
      network_stats = EthermineApi::Pool.network_stats
      expect(network_stats).not_to be nil
      expect(network_stats.status).to eq "OK"
      expect(network_stats.data.time).to eq 1508258052
      expect(network_stats.data.blockTime).to eq 14.3039
      expect(network_stats.data.difficulty).to eq 1458581131117615
      expect(network_stats.data.hashrate).to eq 109164314474671
      expect(network_stats.data.usd).to eq 320.63
      expect(network_stats.data.btc).to eq 0.05737
    end
  end

  it "gives back pool servers history" do
    VCR.use_cassette('poolServersHistory') do
      servers_history = EthermineApi::Pool.servers_history
      expect(servers_history).not_to be nil
      expect(servers_history.status).to eq "OK"
      expect(servers_history.data.class).to be Array
      expect(servers_history.data.count).to eq 572
      expect(servers_history.data.first.time).to eq 1508172600
      expect(servers_history.data.first.server).to eq "asia1"
      expect(servers_history.data.first.hashrate).to eq 6897263944444.48
    end
  end
end
