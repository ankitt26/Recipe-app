class InventoryFoodsController < ApplicationController
    def index
        @inventory_foods = InventoryFood.all
    end

    def new
        @inventory = Inventory.find(params[:inventory_id])
        @inventory_food = InventoryFood.new
        @foods = Food.all
        @foods_array = []
        @foods.each do |food|
            @foods_array << [food.name, food.id]
        end
        @inventories = Inventory.all
    end

    def edit
        @inventory_food = InventoryFood.find(params[:id])
        @foods = Food.all
        @foods_array = []
        @foods.each do |food|
            @foods_array << [food.name, food.id]
        end
        @inventories = Inventory.all
    end

    def destroy
        @inventory_food = InventoryFood.find(params[:id])
        @inventory_food.destroy
        redirect_to inventory_path
    end

    def create
        puts inventory_food_params
        @inventory_food = InventoryFood.new(inventory_food_params)
        if @inventory_food.save
            redirect_to inventory_inventory_foods_path(params[:inventory_id])
        else
            render :new
        end
    end

    def show
      @inventory_food = InventoryFood.find(params[:id])
    end

    def inventory_food_params
        params.require(:inventory_food).permit(:inventories_id, :food_id, :quantity)
    end
end
