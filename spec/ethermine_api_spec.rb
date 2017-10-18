require "spec_helper"

RSpec.describe EthermineApi do
  it "has a version number" do
    expect(EthermineApi::VERSION).not_to be nil
  end

  it "has a pool endpoint" do
    expect(EthermineApi::Pool).not_to be nil
  end

  it "has a miner endpoint" do
    expect(EthermineApi::Miner).not_to be nil
  end

  it "has a worker endpoint" do
    expect(EthermineApi::Worker).not_to be nil
  end
end
