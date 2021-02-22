class PostsController < ApplicationController
    before_action :authenticate_user!,except:[:index,:show,:search]
    before_action :set_post,  only:[:show,:edit,:destroy,:update]
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

  def search
    @posts =Post.search(params[:keyword])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
      if @post.destroy
        redirect_to posts_path
      end
  end

  def favorites
    @favorite_posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:spa_name,:features,:congestion_rate_id,:visit_time_id,:review,:image,:strange_person).merge(user_id: current_user.id)
  end
  def set_post
    @post=Post.find(params[:id])
  end
end
