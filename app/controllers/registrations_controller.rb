class RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html

  def after_sign_up_path_for(resource)

    user_path(current_user )
  end
end
