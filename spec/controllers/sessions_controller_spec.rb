require 'spec_helper'

describe SessionsController do

  describe "new" do
    context "guest user" do
      it "should respond with success" do
        get 'new'
        response.should be_success
      end

      it "should render new" do
        get 'new'
        response.should render_template('new')
      end

      it "should initialize user session" do
        get 'new'
        assigns[:user_session].should_not be_nil
      end
    end

    context "logged in user" do
      it "should render already logged in page" do
        controller.current_user = Factory :admin
        get 'new'
        response.should render_template('already_logged_in')
      end

    end
  end

end
