class RecipesController < ApplicationController
  def index
    render json: current_user.recipes, status: :ok
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      render json: @recipe, status: :created
    else
      # TO-DO: return more informative error
      render status: :bad_request
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :website, :source, {:ingredients => []}, {:directions => []}, :notes, :servings, :prep_time, :cook_time, {:tags => []})
  end
end
