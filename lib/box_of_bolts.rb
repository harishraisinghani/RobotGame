require_relative 'item'
require_relative 'robot'

class BoxOfBolts < Item

  DEFAULT_BOLTS_WEIGHT = 25
  DEFAULT_ROBOT_HEAL_POINTS = 20

  def initialize
    super('Box of bolts', DEFAULT_BOLTS_WEIGHT)
  end

  def feed(robot)
    robot.heal(DEFAULT_ROBOT_HEAL_POINTS)
  end
end
