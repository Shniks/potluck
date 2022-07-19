require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/dish'

class DishTest < Minitest::Test

  def test_if_it_exists
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_instance_of Dish, dish
  end

  def test_if_it_has_attributes
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_equal "Couscous Salad", dish.name
    assert_equal :appetizer, dish.category
  end
    
end
