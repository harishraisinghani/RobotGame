require_relative 'spec_helper'

describe Robot do

  describe ".count" do
    before :each do
      Robot.reset_count_for_testing
    end

    it "should return 0 count of robot instances" do
      expect(Robot.count).to eq(0)
    end

    it "should return 1 count of robot instances" do
      Robot.new
      expect(Robot.count).to eq(1)
    end

    it "should return 20 counts of robot instances" do
      20.times { Robot.new }
      expect(Robot.count).to eq(20)
    end
  end
end
