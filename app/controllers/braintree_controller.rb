class BraintreeController < ApplicationController
  # @user = current_user

  def new
    @listing = Listing.find(params[:listing_id])
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => "10.00", #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      redirect_to root_path, :flash => { :success => "Transaction successful!" }
    else
      redirect_to root_path, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

  # def braintree_params
  #   params.require(:).permit(:)
  # end
  
end
