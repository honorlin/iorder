class ShopsController < ApplicationController
  layout "backstage"
  before_action :authenticate_user!
  
  def index
  	@shops = Shop.order("id desc")
  end

  def show
  	@shop = Shop.find(params[:id])

  end

  def new
  	@shop = Shop.new
  end

  def create
  	@shop = Shop.new(shop_params)
  	if @shop.save
  		flash[:warning] = "Success!"
  		redirect_to shops_path
  	else
  		flash[:warning] = "Fail!:#{@shop.errors.full_messages}"
  		render :new
  	end

  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
  	@shop = Shop.find(params[:id])
  	
  	if @shop.update_attributes(shop_params)
  		flash[:warning] = "Success!"
  		redirect_to shops_path
  	else	
  		flash[:warning] = "Fail!:#{@shop.errors.full_messages}"
  		render :edit
  	end 

  end

  def destroy
  	@shop = Shop.find(params[:id])
  	@shop.destroy
  	redirect_to shops_path
  end

private

	def shop_params
		params.require("shop").permit(:name, :location, :hours, :menu_image)
	end

end