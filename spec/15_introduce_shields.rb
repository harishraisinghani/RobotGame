require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#shield" do
    it "should be 50" do
      expect(@robot.shield).to eq(50)
    end
  end

  describe "#wound" do
    it "decreases shield value first" do
      @robot.wound(20)
      expect(@robot.shield).to eq(30)
      expect(@robot.health).to eq(100)
    end

    it "doesn't decrease shield value below 0. When shield is 0, health value starts to decrease" do
      @robot.wound(140)
      expect(@robot.shield).to eq(0)
      expect(@robot.health).to eq(10)
    end
    
    it "doesn't decrease health below 0" do
      @robot.wound(210)
      expect(@robot.shield).to eq(0)
      expect(@robot.health).to eq(0)
    end
  end
end