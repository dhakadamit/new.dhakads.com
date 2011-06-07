class ApplicationController < ActionController::Base
  include Mixins::AuthenticatedSession

  protect_from_forgery
end
