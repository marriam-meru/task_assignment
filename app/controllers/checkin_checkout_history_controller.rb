class CheckinCheckoutHistoryController < ApplicationController
  before_action :authenticate_user!
  before_action :require_institution_user, only: [:create, :new]
  def new
  end

  def create
    if !(CheckinCheckoutHistory.is_user_available?(current_user)) || CheckinCheckoutHistory.is_checkout?(current_user) 
      CheckinCheckoutHistory.create!(user_id: current_user.id, user_checkin_checkout_status: 'checkin', user_time: DateTime.now)
    else 
      CheckinCheckoutHistory.create!(user_id: current_user.id, user_checkin_checkout_status: 'checkout', user_time: DateTime.now)
    end

    redirect_to custom_user_index_path
  end

  def show
    if current_user.institution_manager?
      @checkin_history = CheckinCheckoutHistory.where(user_id:params[:id], user_checkin_checkout_status: 'checkin').all
      @checkout_history = CheckinCheckoutHistory.where(user_id:params[:id], user_checkin_checkout_status: 'checkout').all
    else 
      @checkin_history = CheckinCheckoutHistory.where(user_id:current_user.id, user_checkin_checkout_status: 'checkin').all
      @checkout_history = CheckinCheckoutHistory.where(user_id:current_user.id, user_checkin_checkout_status: 'checkout').all
    end
  end

  def require_institution_user
    if !current_user.institution_user?
      redirect_to custom_user_index_path
    end
  end
end
