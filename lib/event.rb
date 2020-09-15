class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    names = @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory[item] > 0
    end
  end

  def total_inventory
    total_inventory = Hash.new{ |hash, key| hash[key] = {:quantity => 0, :food_trucks =>[]}}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_inventory[item][:quantity] += quantity
        total_inventory[item][:food_trucks] << food_truck
      end
    end
    total_inventory
  end
end
