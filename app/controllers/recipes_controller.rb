class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit destroy]
  def new
    @coffee = Coffee.find(params[:coffee_id])
    @recipe = @coffee.recipes.new
  end

  def create
    @coffee = Coffee.find(params[:coffee_id])
    @recipe = @coffee.recipes.new(recipe_params)

    if @recipe.save
      flash[:success] = 'Recipe has been successfully created'
      redirect_to coffees_path
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
      redirect_to coffees_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:brew_method, :feedback, :roast_date, :coffee_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
