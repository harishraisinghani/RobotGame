require_relative 'spec_helper'

describe Robot do

  describe "#scan" do
    before :each do
      Robot.reset_count_for_testing
      @robot = Robot.new
    end

    it "should return nil array since no adjacent target" do
      expect(@robot.scan).to eq([])
    end

    it "should return array of adjacent location scans" do
      enemy1 = Robot.new
      enemy1.move_left
      enemy2 = Robot.new
      enemy2.move_down
      expect(@robot.scan).to eq([[-1,0],[0,-1]])
    end

    it "should return array of adjacent location scans even if robot moves" do
      @robot.move_left
      enemy3 = Robot.new
      enemy3.move_left
      enemy3.move_left
      expect(@robot.scan).to eq([[-2,0]])
    end
  end
end