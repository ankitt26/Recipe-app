require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  @user = User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef')
  @recipe = Recipe.new(user: @user,
                       name: 'Perfect Chicken',
                       description: '',
                       preparation_time: 10,
                       cooking_time: 75)
  @food = Food.new(name: 'Chicken',
                   measurement_unit: 'lbs',
                   price: 1.99)
  subject do
    RecipeFood.new(food_id: @food,
                   quantity: 1,
                   recipe_id: @recipe)
  end
  it 'should have a quantity' do
    subject.quantity = nil
    expect(subject).not_to be_valid
  end
end
