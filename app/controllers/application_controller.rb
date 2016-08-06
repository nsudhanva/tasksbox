class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
  	redirect_to root_path, alert: "You are not allowed to access this page"
  end

  before_filter do
  	resource = controller_name.singularize.to_sym
  	method = "#{resource}_params"
  	params[resource] &&= send(method) if respond_to?(method, true)
  end
end
