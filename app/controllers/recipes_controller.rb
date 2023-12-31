class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  load_and_authorize_resource
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @food = Food.all
    # @recipe = Recipe.all
    @recipe_food = RecipeFood.all
    @inventory = Inventory.where(user_id: current_user.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_to_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    respond_to(&:js)
  end

  def submit
    selected_food_id = params[:selected_food]
    recipe_id_param = params[:recipe_id_param]

    if selected_food_id.present? && recipe_id_param.present?
      recipe_food = RecipeFood.new(quantity: 1, food_id: selected_food_id, recipe_id: recipe_id_param)

      # redirect_to request.referer # Redirect to an appropriate path after processing

      if recipe_food.save
        # Successfully saved
        flash[:notice] = 'Food item added to the recipe.'
      else
        # Handle validation errors
        flash[:alert] = recipe_food.errors.full_messages.join(', ')
      end
    end

    redirect_to submit_food_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
