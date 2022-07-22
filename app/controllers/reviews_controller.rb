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
      redirect_to recipe_path(@recipe)
      flash[:notice] = "You need to leave a comment and a rating between 1 and 5"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to recipe_path(@recipe), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
