class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.search(params[:query])
    if request.xhr?
      render :json => @user.to_json
    end
  end

end
