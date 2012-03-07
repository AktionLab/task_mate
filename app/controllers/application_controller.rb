class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env.production? or Rails.env.development?
    rescue_from CanCan::AccessDenied do
      if current_user
        redirect_to root_path, :alert => "You are not authorized to view that page."
      else
        redirect_to new_user_session_path, :alert => "Please login to view the page."
      end
    end
  end
end
