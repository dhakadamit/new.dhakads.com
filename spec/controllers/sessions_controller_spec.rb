require 'spec_helper'

describe SessionsController do

  describe "login" do
    it "should respond with success" do
      get 'login'
      response.should be_success
    end
  end

end
