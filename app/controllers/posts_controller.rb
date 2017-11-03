class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @post=Post.new
  end

  def create
   user=User.find(params[:id])
   post = user.posts.new(title: params[:post][:title], content: params[:post][:content], thumbnail: params[:post][:thumbnail])
   if  post.save
       redirect_to posts_path
   else
       redirect_to new_post_path
   end     
  end 

  def index
    # Địa điểm du lịch
    @post=Post.censored.order(:created_at => :desc).page(params[:page]).per(4)

    # Địa điểm nôi bật
    @posts_count=Post.limit(3).order("RAND()")
  end

  def show
    @post=Post.find(params[:id])
  end

  def censored
    post=Post.find(params[:id])
    if post.update(censored: 1)
      redirect_to admin_administrator_path
    else
      redirect_to post_path 
    end
  end

  def uncensored
    if Post.find(params[:id]).destroy
      redirect_to admin_administrator_path
    else
      redirect_to post_path 
    end
  end

end
