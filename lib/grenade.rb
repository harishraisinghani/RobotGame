require_relative 'weapon'

class Grenade < Weapon

  DEFAULT_WEIGHT = 40
  DEFAULT_DAMAGE = 15
  DEFAULT_RANGE = 2

  attr_reader :range

  def initialize
    super('Grenade', DEFAULT_WEIGHT, DEFAULT_DAMAGE)
    @range = DEFAULT_RANGE
  end
end
