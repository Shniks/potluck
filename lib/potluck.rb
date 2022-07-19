require './lib/dish'
require 'pry'

class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def get_all_from_category(category)
    dishes.find_all do |dish|
      category == dish.category
    end
  end

  def categories
    dishes.map { |dish| dish.category }.uniq
  end

  def pluralize(category)
    (category.to_s + "s").to_sym
  end

  def menu
    menu = Hash.new { |k, v| k[v] = [] }
    insert_dishes_into_menu(menu)
    sort_dishes(menu)
  end

  def insert_dishes_into_menu(menu)
    categories.each do |category|
      cat_dishes = get_all_from_category(category)
      menu_cat = pluralize(category)
      assign_dishes_to_category(cat_dishes, menu, menu_cat)
    end
  end

  def assign_dishes_to_category(cat_dishes, menu, menu_cat)
    cat_dishes.each { |dish| menu[menu_cat] << dish.name }
  end

  def sort_dishes(menu)
    menu.map { |category, names| names.sort! }
    menu
  end

  def ratio(category)
    (get_all_from_category(category).length / dishes.length.to_f * 100).round(1)
  end

end
