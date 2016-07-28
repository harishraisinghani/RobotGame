require_relative 'item'
require_relative 'robot'

class Weapon < Item

  attr_reader :name, :weight, :damage

  def initialize(name, weight,damage)
    @name = name
    @weight = weight
    @damage = damage
  end

  def hit(enemy_robot)
    enemy_robot.wound(damage)
  end
end
