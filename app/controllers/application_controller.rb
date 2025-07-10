class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user
  helper_method :pin_login?
  before_action :strong_logout

  def current_user
    unless @current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    @current_user
  end

  def strong_logout #solve logout problems
    response.headers["Cache-Control"] = "no-store"
    #https://www.imperva.com/learn/performance/cache-control/#:~:text=an%20origin%20server.-,Cache%2DControl%3A%20No%2DStore,such%20as%20personal%20banking%20details.
  end

  def pin_login? #check for login with pin
    session[:login_method] == "pin"
  end
end
