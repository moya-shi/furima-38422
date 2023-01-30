class PurchasesController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
  end

  # def create
  #   @purchase_destination = PurchaseDestination.new(purchase_params)
  #   if @purchase_destination.valid?
  #     @purchase_destination.save
  #     redirect_to root_path
  #   else
  #     render :index
  #   end
  # end

  # private
  
  # def purchase_params
  #   params.require(:purchase_destination).permit(:postcode, :shipping_address_id, :municipality, :address, :building :phone_number).merge(user_id: user_id, item_id: item_id, purchase_id: purchase_id)
  # end


end
