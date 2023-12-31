class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          redirect_to foods_path, notice: 'food was successfully added.'
        else
          render :new
          flash.now[:alert] = 'food could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
