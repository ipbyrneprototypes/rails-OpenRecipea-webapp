class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_recipe
  before_action :authenticate_user!

  respond_to :html


  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.recipe_id = @recipe.id
    
    @review.save
    respond_with(@recipe)
  end

  def update
    @review.update(review_params)
    respond_with(@recipe)
  end

  def destroy
    @review.destroy
    respond_with(@recipe)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
  
    def find_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
