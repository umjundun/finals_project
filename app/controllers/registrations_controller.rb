class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :organization_id
    )
  end

  def account_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :job_title,
      :contact_number,
      :facebook,
      :twitter,
      :instagram,
      :linkedin,
      :github,
      :bio,
      :interests,
      :experience,
      :skills,
      :photo,
      :hibernate
    )
  end
end
