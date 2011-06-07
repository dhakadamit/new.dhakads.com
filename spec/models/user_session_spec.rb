require "spec_helper"

describe "UserSession" do

  context "initialize" do
    it "should set email" do
      @user_session = UserSession.new(:email => "email@gmail.com")
      @user_session.email.should == "email@gmail.com"
    end

    it "should set password" do
      @user_session = UserSession.new(:password => "p@ssw0rd")
      @user_session.password.should == "p@ssw0rd"
    end
  end

  it "should not allow email to be set explicitly" do
    @user_session = UserSession.new
    @user_session.should_not respond_to :email=
  end

  it "should not allow password to be set explicitly" do
    @user_session = UserSession.new
    @user_session.should_not respond_to :password=
  end

end