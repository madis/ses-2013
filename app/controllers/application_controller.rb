class ApplicationController < ActionController::Base
  protect_from_forgery
  def active?(name)
    'active' if params[:action] == name
  end

  helper_method :active?

end
