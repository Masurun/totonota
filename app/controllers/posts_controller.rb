class PostsController < ApplicationController
    before_action :authenticate_user!,except:[:index]
  def index
    @posts=Post.all.includes(:user).order('created_at DESC')
  end
  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  def show
  end

  private
  def post_params
    params.require(:post).permit(:spa_name,:features,:congestion_rate_id,:visit_time_id,:review,:image,:strange_person).merge(user_id: current_user.id)
  end
end
