require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#health" do
    it "should be 100" do
      expect(@robot.health).to eq(100)
    end
  end

  describe "#wound" do
    it "decreases health only after shield is depleted" do
      @robot.wound(20)
      expect(@robot.health).to eq(100)
    end

    it "doesn't decrease health below 0 after shield is depleted" do
      @robot.wound(200)
      expect(@robot.health).to eq(0)
    end
  end

  describe "#heal" do
    it "increases health" do
      @robot.wound(90)
      @robot.heal(20)
      expect(@robot.health).to eq(80)
    end

    it "doesn't increase health over 100" do
      @robot.heal(10)
      expect(@robot.health).to eq(100)
    end
  end

  describe "#heal!" do
    it "raises RobotAlreadyDeadError if health <=0" do
      @robot.wound(150)
      expect { @robot.heal! }.to raise_error(RobotAlreadyDeadError)
    end
  end

  describe "#attack" do
    it "wounds other robot with weak default attack (5 hitpoints)" do
      robot2 = Robot.new

      # Create an expectation that by the end of this test,
      # the second robot will have had #wound method called on it
      # and 5 (the default attack hitpoints) will be passed into that method call
      expect(robot2).to receive(:wound).with(5)

      # This is what will trigger the wound to happen on robot2
      @robot.attack(robot2)
    end
  end

  describe "#attack!" do
    it "raises UnattackableEnemyError if enemy class is not a robot" do
      @laser = Laser.new
      expect { @robot.attack!(@laser) }.to raise_error(UnattackableEnemyError)
    end
  end
end
