class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: root_path, alert: "You are not authorized to perform this action."
  end

  def not_found
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
