class SessionsController < ApplicationController
  def new
    render("already_logged_in") and return if logged_in?

    @user_session = UserSession.new
  end

  def create
    head :ok
  end
end
