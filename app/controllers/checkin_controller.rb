class CheckinController < ApplicationController
  before_action :authenticate_user!
  before_action :require_institution_user, only: [:create, :new]
  def new
  end

  def create 
    @checkin = UserCheckin.new(:user_id => current_user.id, :checkin_time => DateTime.now)
    if(@checkin.save)
      redirect_to root_path
    end
  end

  def show
    if is_institution_user?
      @name = current_user.first_name.capitalize
      @checkin_history = UserCheckin.where(:user_id => current_user.id).all
      @checkout_history = UserCheckout.where(:user_id => current_user.id).all
    else
      @name = User.where(:id => params[:id]).pluck(:first_name)
      @name = @name[0]
      @checkin_history = UserCheckin.where(:user_id => params[:id]).all
      @checkout_history = UserCheckout.where(:user_id => params[:id]).all
    end

  end
  def require_institution_user
    if current_user.user_role != "institution user"
      redirect_to custom_user_index_path
    end
  end
end
