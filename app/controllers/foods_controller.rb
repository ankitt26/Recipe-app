class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = Food.all
  end

  def new
    
  end
end
