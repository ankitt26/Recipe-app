require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef') }
  @inventory = Inventory.new(user_id: @user)
  @food = Food.new(
    name: 'Rice',
    measurement_unit: 'kg',
    price: 5.99
  )
  subject do
    InventoryFood.new(
      quantity: 4,
      inventory_id: @inventory, # Associate with the inventory instance
      food_id: @food # Associate with the food instance
    )
  end

  before { subject.save }

  it 'should have an inventory' do
    # You can check if the inventory association is set properly
    expect(subject.inventory).to eq(@inventory)
  end

  it 'should have a food' do
    # You can check if the food association is set properly
    expect(subject.food).to eq(@food)
  end

  it 'should have a valid quantity' do
    subject.quantity = nil
    expect(subject).not_to be_valid
  end
end
