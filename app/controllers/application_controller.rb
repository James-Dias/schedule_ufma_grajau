class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  	def user_not_authorized
    	flash[:error] = 'Você não tem permissão para fazer esta ação!'
    	redirect_to(request.referrer || root_path)
  	end

	protected

	  def after_sign_in_path_for(current_user)
	    root_path
	  end
end
