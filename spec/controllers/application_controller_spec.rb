require "spec_helper"

describe "ApplicationController" do

  context "AuthenticateSession" do
    xit "should respond to current_user" do
      controller.should respond_to :current_user
    end
  end
end