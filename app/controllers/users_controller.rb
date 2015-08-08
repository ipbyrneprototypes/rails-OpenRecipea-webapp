class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user, only: [:upvote, :downvote]
  
  
  def index
    @likedusers = User.all
    @user = current_user
     if params[:category].blank?
        @recipes = Recipe.all.order("created_at DESC")
      else
        @category_id = Category.find_by(name: params[:category]).id
        @recipes = Recipe.where(category_id: @category_id).order("created_at DESC")
      end
  end
  
  
  def show
    if user_signed_in?
      @recipes = Recipe.all.order("created_at")
    else
      @recipes = Recipe.all.order("created_at")
    end
    
    @user = User.find(params[:id])
    @likedusers = User.all
    
    
    
    if params[:privacy].blank?
      @recipes = Recipe.all.order("created_at")
     else
      @privacy_id = Privacy.find_by(name: params[:privacy]).id
      @recipes = Recipe.where(privacy_id: @privacy_id).order("created_at")
      @privaterecipes = Recipe.where(user_id: current_user.id).order("created_at")
     end
    
     if params[:category].blank?
      @recipes = Recipe.all.order("created_at")
     else
      @category_id = Category.find_by(name: params[:category]).id
      @recipes = Recipe.where(category_id: @category_id).order("created_at ")
     @privaterecipes = Recipe.where(user_id: current_user.id).order("created_at")
     end
  end
  
  def upvote
    @user.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @user.downvote_by current_user
    redirect_to :back
  end
  
  private

  def find_user
    @user = User.find(params[:id])
  end
  
end
