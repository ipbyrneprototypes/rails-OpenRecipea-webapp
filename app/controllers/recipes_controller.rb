class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
    before_action :authenticate_user!, except: [:index, :show]
  
    def search
      if params[:search].present?
        @recipes = Recipe.search(params[:search])
        @users = User.search(params[:search])
      else
        @recipes = Recipe.all
        @users = User.all
      end  
      
    end
    
    def index
      if params[:category].blank?
        @recipes = Recipe.limit(12).all.order("RANDOM()")
      else
        @category_id = Category.find_by(name: params[:category]).id
        @current_category = Category.find_by(name: params[:category]).name
        @recipes = Recipe.where(category_id: @category_id).order("RANDOM()").paginate(page: params[:page], per_page: 12)
      end
    end
    
    def show
      @reviews = Review.where(recipe_id: @recipe.id).order("created_at DESC")
      @random_recipe = Recipe.where.not(id: @recipe).order("RANDOM()").first
      
      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
      end
      
      
    end
    
    def new
        @recipe = current_user.recipes.build
    end
    
    def create
        @recipe = current_user.recipes.build(recipe_params)
        
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created new recipe"
        else
            render "new"
        end
    end
    
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    
    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "successfuly deleted recipe."
    end
  
  def upvote
    @recipe.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @recipe.downvote_by current_user
    redirect_to :back
  end
    
    private
    def recipe_params
      params.require(:recipe).permit(:category_id, :privacy_id, :title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
    
end
