require 'pry'
class Human

  def initialize(name)
    @name = name
    @alertness = 0.01
    @fullness = nil 
  end

  def alertness
    @alertness
  end

  def has_coffee?
    false
  end

  def needs_coffee?
    true
  end

  def buy(coffee)
  @fullness = coffee
  end


  def drink!
    @fullness.slurp
    @alertness += 0.3
  end



end
