require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "#total_calories" do
    it "returns the total caloires for that dish" do

    chef = Chef.create!(name: "Ben Little")

    dish = Dish.create!(name: "Spicy Thai", description: "very very spicy", chef: chef)

    ingredient1 = Ingredient.create!(name: "Chili", calories: 4)
    ingredient2 = Ingredient.create!(name: "noodles", calories: 12)
    ingredient3 = Ingredient.create!(name: "sauce", calories: 2)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2
    dish.ingredients << ingredient3

    expect(dish.total_calories).to eq(18)
  end
  end
end
