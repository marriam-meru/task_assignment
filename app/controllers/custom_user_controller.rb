class CustomUserController < ApplicationController
  before_action :get_user, only: [:update, :destroy ,:show ,:edit]
  before_action :authenticate_user!
  before_action :require_admin, only: [:create, :new, :destroy]


  def new
    @institution = Institution.all
    @user = User.new
  end

  def index
    if current_user.admin?
      @users =  User.where(roles: User.roles.except(:admin).keys)
    else
      @users =  User.where(roles: User.roles.except(:admin).keys, institution_id: current_user.institution_id).all
    end
  end

  def create
    User.create!(user_params)
  end


  def update
    if current_user.admin? and params[:commit] == "Assign Manager"
      @user.update!(roles: 'institution_manager', institution_id:params[:institution_id])
    else
      @user.update!(roles: 'institution_user', institution_id: current_user.institution_id)
    end
    redirect_to custom_user_index_path

  end

  def destroy
    @user.destroy
    redirect_to custom_user_index_path
  end


  def edit
    @institution = Institution.all
  end


  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number ,:address, :email, :password, :institution_id, :roles)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def require_admin
    if !current_user.admin?
      redirect_to custom_user_index_path
    end
  end
end
