class FollowersController < ApplicationController
  def show
    if user_signed_in?
      @recipes = Recipe.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
    else
      @recipes = Recipe.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
    end
    
    @user = User.find(params[:id])
    @likedusers = User.all
    
     if params[:category].blank?
      @recipes = Recipe.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
     else
      @category_id = Category.find_by(name: params[:category]).id
      @recipes = Recipe.where(category_id: @category_id).order("created_at DESC").paginate(page: params[:page], per_page: 8)
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
end
