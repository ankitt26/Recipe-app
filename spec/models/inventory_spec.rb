require 'rails_helper'

RSpec.describe Inventory, type: :model do
  @user = User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef')

  subject do
    Inventory.new(user_id: @user)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end
