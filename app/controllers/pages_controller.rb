class PagesController < ApplicationController
  def home
    @posts = Post.all
    @tags = Tag.all
    @post = current_user.posts.build if user_signed_in?
  end

  def userhome
    @tags = Tag.all
    if (User.find_by_username(params[:id]))
      @username = params[:id]
      the_user = User.find_by_username(params[:id])
      @posts = the_user.posts
      if @username == current_user.username
        @post = current_user.posts.build
      end
    else
      redirect_to root_path, notice: "User not found."
    end
  end

  def help
  end

  def about
  end

  def members
    @users = User.all
  end

    private
    # maybe not needed
    def post_params
      params.require(:post).permit(:title, :body, :taglist)
    end
end
