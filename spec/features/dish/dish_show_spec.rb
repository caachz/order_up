require 'rails_helper'

RSpec.describe "When a visitor goes to the dish show page" do
  it "shows the name of the chef and ingredients of the dish" do
    chef = Chef.create!(name: "Ben Little")

    dish = Dish.create!(name: "Spicy Thai", description: "very very spicy", chef: chef)

    ingredient1 = Ingredient.create!(name: "Chili", calories: 4)
    ingredient2 = Ingredient.create!(name: "noodles", calories: 12)
    ingredient3 = Ingredient.create!(name: "sauce", calories: 2)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2
    dish.ingredients << ingredient3

    visit "/dishes/#{dish.id}"

    expect(page).to have_content("Ben Little")
    expect(page).to have_content("Chili")
    expect(page).to have_content("noodles")
    expect(page).to have_content("sauce")
  end

  it "sees total calorie count per dish" do
    chef = Chef.create!(name: "Ben Little")

    dish = Dish.create!(name: "Spicy Thai", description: "very very spicy", chef: chef)

    ingredient1 = Ingredient.create!(name: "Chili", calories: 4)
    ingredient2 = Ingredient.create!(name: "noodles", calories: 12)
    ingredient3 = Ingredient.create!(name: "sauce", calories: 2)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2
    dish.ingredients << ingredient3

    visit "/dishes/#{dish.id}"

    expect(page).to have_content("Total Calolires: 18")
  end
end
