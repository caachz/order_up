require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "#all_ingredients" do
    it "returns a list of all unique ingredients used by the chef" do

    chef = Chef.create!(name: "Ben Little")

    dish = Dish.create!(name: "Spicy Thai", description: "very very spicy", chef: chef)

    ingredient1 = Ingredient.create!(name: "Chili", calories: 4)
    ingredient2 = Ingredient.create!(name: "noodles", calories: 12)
    ingredient3 = Ingredient.create!(name: "sauce", calories: 2)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2
    dish.ingredients << ingredient3

    expect(chef.all_ingredients[0].split(',')[1]).to eq('Chili')
    expect(chef.all_ingredients[1].split(',')[1]).to eq('noodles')
    expect(chef.all_ingredients[2].split(',')[1]).to eq('sauce')
  end
  end
end
