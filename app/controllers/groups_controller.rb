class GroupsController < ApplicationController
  layout "backstage"
  before_action :authenticate_user!
  
  def index
  	@groups = Group.order("id desc")
  end

  def show
  	@group = Group.find(params[:id])

  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(group_params)
  	if @group.save
  		flash[:warning] = "Success!"
  		redirect_to groups_path
  	else
  		flash[:warning] = "Fail!:#{@group.errors.full_messages}"
  		render :new
  	end

  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
  	@group = Group.find(params[:id])
  	
  	if @group.update_attributes(group_params)
  		flash[:warning] = "Success!"
  		redirect_to groups_path
  	else	
  		flash[:warning] = "Fail!:#{@group.errors.full_messages}"
  		render :edit
  	end 

  end

  def destroy
  	@group = Group.find(params[:id])
  	@group.destroy
  	redirect_to groups_path
  end

private

	def group_params
		params.require("group").permit(:title, :date, :date)
	end

end