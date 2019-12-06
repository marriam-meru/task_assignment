class CustomUserController < ApplicationController
  before_action :get_user, only: [:update, :destroy ,:show ,:edit]
  before_action :authenticate_user!
  before_action :require_admin, only: [:create, :new, :destroy]
  def new
    @institution = Institution.all
    @user = User.new
  end

  def index
    @isntitution_record = User.joins("INNER JOIN institutions ON institutions.id = users.institution_id ").select(:id, :name)
    if is_admin?
      @users =  User.where(:user_role => ['institution manager', 'institution user','no role','No Role']).all
    else
      @users =  User.where(:user_role => ['institution user','no role']).all
    end

  end

  def create
    User.create!(user_params)
  end


  def update
    if is_admin? and params[:commit] == "Assign Manager"
      @user.update!(user_role:'institution manager', institution_id:params[:institution_id])
    else
      @user.update!(user_role:'institution user', institution_id:params[:institution_id])
    end
    redirect_to custom_user_index_path

  end

  def destroy
    @user.destroy
    redirect_to custom_user_index_path
  end

  def get_institution_name(id)
  end

  def edit
    @institution = Institution.all
  end

  def show
    if is_institution_manager? 
      @isntitution_record = User.joins("INNER JOIN institutions ON institutions.id = users.institution_id ").select(:institution_id, :id)
      institute_id = User.where(id: params[:id]).pluck(:institution_id)
      @user = User.where(institution_id: institute_id[0])
      @isntitution_record = User.joins("INNER JOIN institutions ON institutions.id = users.institution_id ").select(:id, :name)
    end
  end
  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number ,:address, :email, :password, :institution_id, :user_role)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def require_admin
    if current_user.user_role != "admin"
      redirect_to custom_user_index_path
    end
  end
end
