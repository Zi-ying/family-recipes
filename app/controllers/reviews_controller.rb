class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render recipe_path(@recipe), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
