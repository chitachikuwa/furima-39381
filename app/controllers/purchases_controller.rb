class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_costomer = PurchaseCostomer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_costomer = PurchaseCostomer.new(purchase_params)
     if @purchase_costomer.valid? 
       @purchase_costomer.save
        redirect_to root_path
      else
        render 'index'  
     end 
  end

  private

   def purchase_params
    params.require(:purchase_costomer).permit(:postal_code, :shipping_area_id, :city,:address,:building, :phone_num, )
  end 
   end 

