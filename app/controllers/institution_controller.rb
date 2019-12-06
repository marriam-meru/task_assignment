class InstitutionController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:create, :new]



  def index
    if is_admin? 
      @institution = Institution.all
    end
  end

  def create
    Institution.create!(permitted_params)
    redirect_to institution_index_path
  end

  def new
  end

  def edit
    if is_admin? || is_institution_manager? 
      @institution = Institution.find(params[:id])
    end
  end
  def update
    if is_admin? || is_institution_manager? 
      @institution = Institution.find(params[:id])
      @institution.update(permitted_params)
      redirect_to institution_index_path
    end

  end

  def require_admin
    if current_user.user_role != "admin"
      redirect_to root_path
    end

  end
  
  private
    def permitted_params
      params.permit(:name, :logo)
    end
end


