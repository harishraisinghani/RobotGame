require_relative 'weapon'

class Laser < Weapon

  DEFAULT_WEIGHT = 125
  DEFAULT_DAMAGE = 25
  DEFAULT_RANGE = 1

  attr_reader :range

  def initialize
    super('Laser', DEFAULT_WEIGHT, DEFAULT_DAMAGE)
    @range = DEFAULT_RANGE
  end
end
