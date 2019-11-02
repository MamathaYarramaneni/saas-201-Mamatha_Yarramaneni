class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def new 
    @comments=Comment.new
   @user_collection=User.all.collect { |p| [p.email, p.id] }
   @blog_collection=BlogPost.all.collect { |p| [p.title, p.id ] }
  end
  def create
    @comments = Comment.new(comment_params)
    if @comments.save
      redirect_to blog_posts_path
    else
      render "new"
    end
  end
   private

  def comment_params
    params[:comment].permit( :content, :user_id, :blog_post_id)
  end
end
