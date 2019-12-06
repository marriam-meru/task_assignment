class CheckoutController < ApplicationController

  def new
    
  end
  def create
    @checkout = UserCheckout.new(:user_id => session[:user_id], :checkout_time => DateTime.now)
    if(@checkout.save)
      redirect_to root_path
    end
  end
end
