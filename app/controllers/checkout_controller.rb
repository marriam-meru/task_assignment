class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :require_institution_user, only: [:create, :new, :show]
  def new
  end

  def create 
    @checkout = UserCheckout.new(:user_id => current_user.id, :checkout_time => DateTime.now)
    if(@checkout.save)
      redirect_to root_path
    end
  end

  def require_institution_user
    if current_user.user_role != "institution user"
      redirect_to custom_user_index_path
    end
  end
end
