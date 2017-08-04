class GroupsController < ApplicationController

  def index
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
    @users = User.all
  end

  def create
    @group = current_user.owned_groups.create(group_params)
    redirect_to user_path(current_user)
  end

  def update
  end

  def destroy
  end

  def group_params
    params.require(:group).permit(:title, :description, :owner_id)
  end
end
