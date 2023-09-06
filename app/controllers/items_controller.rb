class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.order("created_at DESC")
  end  

  def new
   @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else  
      render :new
    end  
  end  

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user == @item.user
       redirect_to root_path      
    end
  end  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end    
  end  

  private
  def item_params
    params.require(:item).permit(:image,:item_name,:description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end  


end
