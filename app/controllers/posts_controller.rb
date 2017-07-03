class PostsController < ApplicationController
  def create
  	@post = current_user.posts.build(post_params)
 	respond_to do |f|
  		if (@post.save)
  			f.html { redirect_to root_url, notice: "Post saved"}
  		else
  			messages = ""
  			@post.errors.full_messages.each do |message|
  				messages += message
  			end
  			f.html { redirect_to root_url, notice: "Errors in post: #{messages}" }
  		end
  	end
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
