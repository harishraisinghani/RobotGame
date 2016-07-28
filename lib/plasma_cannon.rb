require_relative 'weapon'

class PlasmaCannon < Weapon

  DEFAULT_WEIGHT = 200
  DEFAULT_DAMAGE = 55

  def initialize
    super('Plasma Cannon', DEFAULT_WEIGHT, DEFAULT_DAMAGE)
  end
end

plasma = PlasmaCannon.new
puts plasma.class.superclass
