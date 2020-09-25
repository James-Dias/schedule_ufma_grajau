class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  	def user_not_authorized
    	flash[:error] = 'Você não tem permissão para fazer esta ação!'
    	redirect_to(request.referrer || root_path)
  	end

    def configure_permitted_parameters
      attributes = [:name, :cpf, :registration, :course, :phone1, :phone2, :kind]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
	protected

	  def after_sign_in_path_for(current_user)
	    root_path
	  end
end
