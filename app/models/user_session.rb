class UserSession
  attr_reader :email, :password
  attr_accessor :errors

  def initialize(params = {})
    @email = params[:email]
    @password = params[:password]
    @errors = {}
  end
end