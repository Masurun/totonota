class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @favorite =Favorite.new(favorite_params)
    if @favorite.save
      redirect_to post_path(@post.id)
    else
      render :show
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to post_path(@post.id)
  end
  private
  def favorite_params
    params.require(:favorite).permit(:user_id,:post_id)
  end
end
