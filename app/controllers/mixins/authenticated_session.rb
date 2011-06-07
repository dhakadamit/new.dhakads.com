module Mixins
  module AuthenticatedSession

    def current_user
      @current_user ||= User.find_by_email(session[:email])
    end

    def current_user=(user)
      @current_user = user
      session[:email] = user.email
    end

    def logged_in?
      current_user
    end

  end
end