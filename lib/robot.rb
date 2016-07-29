require_relative 'item'
require_relative 'robot_already_dead_error'
require_relative 'unattackable_enemy'
#require 'pry-byebug'


class Robot

  @@count = 0
  @@robots= []

  class << self

    def reset_count_for_testing
      @@count = 0
      @@robots = []
    end

    def count
      @@count
    end

    def in_position(x,y)
      position_arr = []
      @@robots.each do |robot|
        if robot.position[0] == x && robot.position[1] == y
          position_arr << robot.position
        end
      end
      position_arr
    end
  end

  include Math

  CAPACITY = 250
  DEFAULT_ATTACK_POINTS = 5

  attr_reader :position, :items, :health, :shield

  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = 100
    @equipped_weapon
    @shield = 50
    @@count += 1
    @@robots << self
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def relative_range(enemy)
    sqrt((enemy.position[0]-position[0])**2 + (enemy.position[1]-position[1])**2)
  end

  def items_weight
    @items.reduce(0) { |sum, item| sum += item.weight }
  end

  def pick_up(item)
    return false if (items_weight + item.weight) > CAPACITY
    @equipped_weapon = item if item.is_a? Weapon
    if item.class == BoxOfBolts && health <=80
      item.feed(self)
    else
      @items << item
    end
  end

  def wound(points)
    if (@health + @shield - points >=100)
      @shield -= points
    elsif (@health + @shield - points >=0)
      @health -= (points - @shield)
      @shield = 0
    else
      @health = 0
      @shield = 0
    end
  end

  def heal(points)
    @health += points
    @health = 100 if @health > 100
  end

  def heal!
    raise RobotAlreadyDeadError, "Robot is dead - cannot be revived" if @health <=0
  end

  def recharge
    @shield = 50
  end

  def attack(enemy)
    if (relative_range(enemy) <= 2 && @equipped_weapon.class == Grenade)
      @equipped_weapon.hit(enemy)
      @equipped_weapon = nil #Discard the grenade after use
    elsif (relative_range(enemy) <= 1)
      if !@equipped_weapon.nil?
        @equipped_weapon.hit(enemy)
      else
        enemy.wound(DEFAULT_ATTACK_POINTS)
      end
    end
  end

  def scan
    Robot.in_position(self.position[0]-1, self.position[1]) + Robot.in_position(self.position[0], self.position[1]+1) + Robot.in_position(self.position[0]+1, self.position[1]) + Robot.in_position(self.position[0], self.position[1]-1)
    #binding.pry
  end


  def attack!(enemy)
    raise UnattackableEnemyError, "Can only attack a robot" if enemy.class != Robot
  end
end

