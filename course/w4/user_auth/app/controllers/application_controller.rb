class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  login_user!(user)
    # handle user login 
  end
end
