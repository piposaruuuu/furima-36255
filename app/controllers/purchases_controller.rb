class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  
  def index
  @purchase_address = PurchaseAddress.new
  if current_user == @item.user
    redirect_to root_path
  end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
       pay_item
       @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :prefecture_id, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
  
  def set_item
  @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
end
