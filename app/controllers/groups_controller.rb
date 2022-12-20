class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params).where(author_id: current_user.id)
    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      flash.now[:alert] = 'Category was not created.'
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
