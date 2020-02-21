require 'rails_helper'

RSpec.describe "When a visitor goes to the chef show page" do
  it "shows the name of the chef and a link to the list of all ingredients" do
    chef = Chef.create!(name: "Ben Little")

    dish = Dish.create!(name: "Spicy Thai", description: "very very spicy", chef: chef)

    ingredient1 = Ingredient.create!(name: "Chili", calories: 4)
    ingredient2 = Ingredient.create!(name: "noodles", calories: 12)
    ingredient3 = Ingredient.create!(name: "sauce", calories: 2)
    ingredient4 = Ingredient.create!(name: "Chicken", calories: 8)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2
    dish.ingredients << ingredient3

    visit "/chefs/#{chef.id}"

    expect(page).to have_content("Ben Little")
    expect(page).to have_link("All Ingredients")

    click_link("All Ingredients")

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")

    expect(page).to have_content("Chili")
    expect(page).to have_content("noodles")
    expect(page).to have_content("sauce")
    expect(page).to_not have_content("chicken")
  end
end
