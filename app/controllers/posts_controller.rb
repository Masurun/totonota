class PostsController < ApplicationController
    before_action :authenticate_user!,except:[:index]
    before_action :set_post,  only:[:show,:edit,:destroy]
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

  def edit

  end

  def destroy
      if @post.destroy
        redirect_to posts_path
      end
  end

  private
  def post_params
    params.require(:post).permit(:spa_name,:features,:congestion_rate_id,:visit_time_id,:review,:image,:strange_person).merge(user_id: current_user.id)
  end
  def set_post
    @post=Post.find(params[:id])
  end
end
