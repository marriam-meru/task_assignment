# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    super do
      byebug
      resource.update!(resource_params)
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  protected
  def resource_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
      :address,
      :time_zome,
      :user_role,
      :institution_id,
      :reset_password_token,
      :password,
      :password_confirmation
    )
  end
end
