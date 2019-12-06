class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    if current_user and (is_admin?  || is_institution_user?)
      redirect_to custom_user_index_path
    else current_user and  is_institution_manager?
      redirect_to custom_user_path(current_user)
    end
  end
end
