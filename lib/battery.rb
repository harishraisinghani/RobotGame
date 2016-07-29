require_relative 'item'
require_relative 'robot'

class Battery < Item

  def initialize
    super('Battery', 25)
  end

  def recharge_shield(robot)
    robot.recharge
  end
end
