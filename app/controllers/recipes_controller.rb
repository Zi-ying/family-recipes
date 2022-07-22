class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @review = Review.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :food_type, :ingredient)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
