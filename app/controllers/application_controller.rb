class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  helper_method :is_admin?, :is_institution_manager?, :is_institution_user?

  def is_admin?
    current_user.user_role == "admin"
  end

  def is_institution_manager?
    current_user.user_role == "institution manager"
  end

  def is_institution_user?
    current_user.user_role == "institution user"
  end

  
end
