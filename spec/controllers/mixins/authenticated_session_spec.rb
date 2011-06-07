require "spec_helper"

describe "AuthenticateSession" do

  class MockController
    attr_accessor :session
    include Mixins::AuthenticatedSession
  end

  before :each do
    @controller = MockController.new
    @controller.session = {}
    @user = Factory(:admin)
  end

  context "current_user" do
    it "should return nil when user email is not set in session" do
      @controller.current_user.should be_nil
    end

    it "should return user whose email is set in session" do
      @controller.session = {:email => @user.email}
      @controller.current_user.should == @user
    end

    it "should return current_user if already set" do
      User.should_not_receive(:find_by_email)
      @controller.current_user = @user
      @controller.current_user.should == @user
    end

    it "should set email for user in session" do
      @controller.current_user = @user
      @controller.session[:email].should == @user.email
    end
  end


  context "logged_in?" do
    it "should return true if current user is not nil" do
      @controller.current_user = @user
      @controller.logged_in?.should be_true
    end

    it "should return true if current user is not nil" do
      @controller.logged_in?.should be_false
    end
  end
end