class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchases, only: [:index, :create]
  
  def index
    @purchase_costomer = PurchaseCostomer.new
    if @item.purchase.present? ||  current_user == @item.user
      redirect_to root_path
    end 
  end

  def create
    @purchase_costomer = PurchaseCostomer.new(purchase_params)
     if  @purchase_costomer.valid? 
       pay_item
       @purchase_costomer.save
         redirect_to root_path
      else
       render 'index'
  end
end 

  private

   def purchase_params
    item_id = params[:item_id]
    item = Item.find(item_id)
    price = item.price

    params.require(:purchase_costomer).permit(:postal_code, :shipping_area_id, :city,:address,:building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token], price: price)
  end 

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
     currency: 'jpy'
    ) 
  end 

  def set_purchases
    @item = Item.find(params[:item_id])
  end  
 end 

