class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:is_admin?)
  end

  def get_viewable_courses
    @viewable_courses = []
    if user_signed_in?
      @viewable_courses = if current_user.is_teacher?
        Course.all
      elsif @user
        @user.courses
      else
        current_user.courses
      end
    end
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
  end
end
