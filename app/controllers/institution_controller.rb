class InstitutionController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :require_admin, only: [:create, :new, :index, :destroy]


  def index
      @institution = Institution.all
  end

  def create
    Institution.create!(institution_params)
    redirect_to institution_index_path
  end

  def new
  end

  def edit
    if current_user.admin? || current_user.institution_manager? 
      @institution = Institution.find(params[:id])
    end
  end
  def update
    if current_user.admin? || current_user.institution_manager? 
      @institution = Institution.find(params[:id])
      @institution.update(institution_params)
      redirect_to institution_index_path
    end

  end

  def require_admin
    if !current_user.admin?
      redirect_to root_path
    end

  end

  def destroy
    Institution.destroy(params[:id])
    redirect_to institution_index_path
  end
  
  private
    def institution_params()
      params.permit(:name, :logo)
    end
end


