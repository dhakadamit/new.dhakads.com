class UserSession
  attr_reader :email, :password

  def initialize(params = {})
    @email = params[:email]
    @password = params[:password]
  end
end