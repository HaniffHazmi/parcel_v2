class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end

  def require_staff
    redirect_to root_path, alert: "Not authorized" unless current_user.admin? || current_user.staff?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :matric_id,
      :building,
      :block,
      :level,
      :room_number,
      :phone_number
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name,
      :matric_id,
      :building,
      :block,
      :level,
      :room_number,
      :phone_number
    ])
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
