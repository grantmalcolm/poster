class PagesController < ApplicationController
  def home
  end

  def userhome
    if (User.find_by_username(params[:id]))
      @username = params[:id]
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
end
