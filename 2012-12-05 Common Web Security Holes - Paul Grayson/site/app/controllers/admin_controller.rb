
class AdminController < ApplicationController
  before_filter :require_logged_in, :except => :login

  def index
  end

  def icon
    redirect_to "/shield.png"
  end

  def login
    if "secret" == params[:password]
      session[:logged_in] = true
      redirect_to "/admin"
    else
      session[:logged_in] = false
      redirect_to "/posts"
    end
  end

  protected

  def require_logged_in
    if !session[:logged_in]
      raise ActionController::RoutingError.new("Not found")
    end
  end
  
end
