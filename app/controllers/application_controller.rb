class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
    access all: [:show, :index, :destroy], company_admin: :all
    # one other option that might seem a bit weird is to put a group of roles in an array:
end
