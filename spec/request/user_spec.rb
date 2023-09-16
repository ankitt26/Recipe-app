require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    # Create a user and sign them in
    @user = User.first
    @user ||= User.create!(
      name: 'pepe',
      email: 'john.doe@mail.com',
      password: 'admin1234'
    )
  end
  before(:each) do
    sign_in @user
  end

  describe 'GET /users/sign_in' do
    it 'renders a successful response' do
      get '/users/edit'
      expect(response).to be_successful # 3
    end

    it 'renders the index action with index view' do
      get '/recipes'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.status).not_to eq(404)
    end

    it 'renders to the foods' do
      get '/foods'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end
end
