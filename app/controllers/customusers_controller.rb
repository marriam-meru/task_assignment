class CustomusersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:edit, :create, :new, :destroy, :index, :update, :assign_institution, :assign_institution_page]

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.user_role != "admin"
      @user.user_role = "institution manager"
      @user.save
    end
    redirect_to customusers_path
  end

  def destroy
    User.destroy(params[:id])
    redirect_to customusers_path
  end

  def assign_institution_page
    @user = User.find(params[:format])
    @institution = Institution.all
  end
  def assign_institution
  end

  def require_admin
    if current_user.user_role != "admin"
      redirect_to root_path
    end

  end

end
