class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :destroy, :update]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.search_by_recipe_characteristic(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @review = Review.new
  end

  def new
   @recipe = Recipe.new
  end

  def create
    @user = current_user.id
    @recipe = Recipe.new(
      name: recipe_params[:name],
      food_type: recipe_params[:food_type],
      ingredient: recipe_params[:ingredient],
      user_id: @user
    )
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
    @recipe.errors.full_messages
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.errors.full_messages
    @recipe.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :food_type, :ingredient, :user_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
