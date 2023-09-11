class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods.all
  end

  # def new
  #   @user = current_user
  #   @food = Food.new
  # end

  # def create
  #   @user = current_user
  #   @food = current_user.foods.build(food_params)
  #   respond_to do |format|
  #     format.html do
  #       if @food.save
  #         redirect_to foods_path, notice: 'food was successfully added.'
  #       else
  #         render :new
  #         flash.now[:alert] = 'food could not be added. Please try again.'
  #       end
  #     end
  #   end
  # end

  # def destroy
  #   @user = current_user
  #   @food = Food.find(params[:id])
  #   @food.destroy
  #   redirect_to foods_path, notice: 'food was successfully deleted.'
  # end

  # private

  # def food_params
  #   params.require(:food).permit(:name,:measurement_unit, :price, :quantity)
  # end
end
