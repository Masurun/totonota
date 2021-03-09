class PostsController < ApplicationController
    before_action :authenticate_user!,except:[:index,:show,:search]
    before_action :set_post,  only:[:show,:edit,:destroy,:update]
    before_action :create_searching_object,only: [:index,:search_post]

  def index
    @posts=Post.all.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      return redirect_to posts_path
    else
      render :new
    end
  end
  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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

  def search_post
    @results = @p.result
  end

  def favorites
    @favorite_posts = current_user.favorites_posts.includes(:user).order(created_at: :desc)
end

  private
  def post_params
    params.require(:post).permit(:spa_name,:congestion_rate_id,:visit_time_id,:review,:image,:sauna_temp_id,:water_temp_id,:pref_id,:chair_count_id).merge(user_id: current_user.id)
  end
  def set_post
    @post=Post.find(params[:id])
  end
  def create_searching_object
    @p = Post.ransack(params[:q]) 
  end
end
