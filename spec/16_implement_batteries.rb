require_relative 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
  end

  it "should be an item" do
    expect(@battery).to be_an(Item)
  end

  it "should have name 'battery'" do
    expect(@battery.name).to eq("Battery")
  end

  it "should have weight 25" do
    expect(@battery.weight).to eq(25)
  end

  describe "#recharge_shield" do
    before :each do
      @robot = Robot.new
    end

    it "recharges the robot's shield" do
      expect(@robot).to receive(:recharge)
      @battery.recharge_shield(@robot)
    end
  end
end