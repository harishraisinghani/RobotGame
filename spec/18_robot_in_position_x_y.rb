require_relative 'spec_helper'

describe Robot do

  describe ".in_position" do
    before :each do
      Robot.reset_count_for_testing
    end

    it "should return array of 4 robots at (0,0)" do
      4.times { Robot.new }
      expect(Robot.in_position(0,0)).to eq([[0,0],[0,0],[0,0],[0,0]])
    end

    it "should return an array with 1 robot at (2,0)" do
      robot = Robot.new
      2.times { robot.move_right }
      expect(Robot.in_position(2,0)).to eq([[2,0]])
    end

    it "should return a nil array with 0 robots at (-3,0)" do
      other_robot = Robot.new
      other_robot.move_right
      expect(Robot.in_position(-3,0)).to eq([])
    end
  end
end
