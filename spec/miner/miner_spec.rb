RSpec.describe EthermineApi::Miner do

  miner_address = "703a08bd7ee10d5f34950527ea957afd818e82a7"

  it "gives back specified miner history" do
    VCR.use_cassette('minerHistory') do
      miner_history = EthermineApi::Miner.history(
        id: miner_address
      )
      expect(miner_history).not_to be nil
      expect(miner_history.status).to eq "OK"
      expect(miner_history.data.class).to be Array
      expect(miner_history.data.last.time).to eq 1508286000
      expect(miner_history.data.last.reportedHashrate).to eq 0
      expect(miner_history.data.last.currentHashrate).to eq 247555555.55555552
      expect(miner_history.data.last.validShares).to eq 215
      expect(miner_history.data.last.invalidShares).to eq 0
      expect(miner_history.data.last.staleShares).to eq 12
      expect(miner_history.data.last.averageHashrate).to eq 207975158.0849142
      expect(miner_history.data.last.activeWorkers).to eq 3
    end
  end

  it "gives back specified miner payouts" do
    VCR.use_cassette('minerPayouts') do
      miner_payouts = EthermineApi::Miner.payouts(id: miner_address)
      expect(miner_payouts).not_to be nil
      expect(miner_payouts.status).to eq "OK"
      expect(miner_payouts.data.class).to be Array
      expect(miner_payouts.data.first.start).to eq 4246675
      expect(miner_payouts.data.first.end).to eq 4342309
      expect(miner_payouts.data.first.amount).to eq 1000144114602165800
      expect(miner_payouts.data.first.txHash).to eq "0x376914aba43724b4637bfac6c0ba3d852f01de6ac9e82f988d8e9663e1f52475"
      expect(miner_payouts.data.first.paidOn).to eq 1507307206
    end
  end

  it "gives back specified miner rounds" do
    VCR.use_cassette('minerRounds') do
      miner_rounds = EthermineApi::Miner.rounds(id: miner_address)
      expect(miner_rounds).not_to be nil
      expect(miner_rounds.status).to eq "OK"
      expect(miner_rounds.data.class).to be Array
      expect(miner_rounds.data.last.block).to eq 4357739
      expect(miner_rounds.data.last.amount).to eq 170531261463282
    end
  end

  it "gives back specified miner settings" do
    VCR.use_cassette('minerSettings') do
      miner_settings = EthermineApi::Miner.settings(id: miner_address)
      expect(miner_settings).not_to be nil
      expect(miner_settings.status).to eq "OK"
      expect(miner_settings.data).to eq "NO DATA"
    end
  end

  it "gives back specified miner statistics" do
    VCR.use_cassette('minerStatistics') do
      miner_statistics = EthermineApi::Miner.stats(id: miner_address)
      expect(miner_statistics).not_to be nil
      expect(miner_statistics.status).to eq "OK"
      expect(miner_statistics.data.time).to eq 1508286600
      expect(miner_statistics.data.lastSeen).to eq 1508286591
      expect(miner_statistics.data.reportedHashrate).to eq 0
      expect(miner_statistics.data.currentHashrate).to eq 252388888.8888889
      expect(miner_statistics.data.validShares).to eq 220
      expect(miner_statistics.data.invalidShares).to eq 0
      expect(miner_statistics.data.staleShares).to eq 11
      expect(miner_statistics.data.averageHashrate).to eq 207878952.1228546
      expect(miner_statistics.data.activeWorkers).to eq 3
      expect(miner_statistics.data.unpaid).to eq 360562059249128900
      expect(miner_statistics.data.unconfirmed).to eq nil
      expect(miner_statistics.data.coinsPerMin).to eq 0.000024037560177154124
      expect(miner_statistics.data.usdPerMin).to eq 0.00756101455372383
      expect(miner_statistics.data.btcPerMin).to eq 0.0000013660545448676688
    end
  end
end
