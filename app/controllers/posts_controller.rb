class PostsController < ApplicationController
  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		flash[:success] = "Post sent"
  	end
  	# this redirection isn't correct
  	redirect_to root_url
  end

  def tags
  	tag = Tag.find_by(name: params[:name])
  	@posts = tag.posts
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body, :taglist)
  	end
end
