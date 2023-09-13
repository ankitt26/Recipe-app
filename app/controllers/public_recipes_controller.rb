class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    # Check if there are no public recipes
    return unless @public_recipes.empty?

    flash[:notice] = 'No public recipes available.'
    redirect_to recipes_path
  end
end
