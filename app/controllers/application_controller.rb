class ApplicationController < ActionController::Base



  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  #
 # Flash messages
 #

 # def after_sign_in_path_for(resource)
 #    request.env['omniauth.origin'] || stored_location_for(resource) || user_path(current_user )
 #  end

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
 end

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", warning: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, '&times;'.html_safe, class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
