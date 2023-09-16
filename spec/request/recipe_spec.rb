require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
    include Devise::Test::IntegrationHelpers
  before(:each) do
    # Create a user and sign them in
    @user = User.first
        @user ||= User.create!(
          name: 'pepe',
          email: 'john.doe@mail.com',
          password: 'admin1234'
        ) 
         
    @recipe = Recipe.create(
      name: 'potato',
      preparation_time: '20 minutes',
      cooking_time: '10 minutes',
      description: 'Potato is a popular meal in the world',
      user_id: @user
    )
  end

  before(:each) do
        sign_in @user
      end

  context 'GET /index' do
    it 'returns http success' do
      get '/recipes'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get '/recipes'
      expect(response).to render_template('recipes/index')
    end

    it 'returns http success for a specific recipe' do
      get "/recipes/#{@recipe.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end
end
