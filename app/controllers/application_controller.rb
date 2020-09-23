class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

	protected

	  def after_sign_in_path_for(current_user)
	    root_path
	  end
end
