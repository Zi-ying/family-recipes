class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
      flash[:alert] = "Review successfully created."
    else
      flash[:alert] = "You need to leave a comment and a rating between 1 and 5"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.find(params[:id])
    @review.destroy
    flash[:alert] = "Review successfully deleted"
    redirect_to recipe_path(@recipe), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :recipe_id, :user_id)
  end
end
