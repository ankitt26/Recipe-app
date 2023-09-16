require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:all) do
    Recipe.delete_all
    Food.delete_all
    User.destroy_all

    @user = User.create!(name: 'charles',
                         email: 'andrews@mail.com',
                         password: '123456',
                         password_confirmation: '123456',
                         confirmed_at: Time.now)
    @food1 = Food.create(
      name: 'Test Food',
      measurement_unit: 'Gram',
      price: 9.99
    )
    @food2 = Food.create(
      name: 'Test Food',
      measurement_unit: 'Gram',
      price: 9.99
    )
    @foods = Food.all
  end

  before(:each) do
    sign_in @user
  end

  it 'I can see the food names' do
    visit foods_path
    @foods.each do |food|
      expect(page).to have_content(food.name)
    end
  end

  it 'I can see the food measurement_units ' do
    visit foods_path
    @foods.each do |food|
      expect(page).to have_content(food.measurement_unit)
    end
  end

  it 'I can see the food price' do
    visit foods_path
    @foods.each do |food|
      expect(page).to have_content(food.price)
    end
  end
end
