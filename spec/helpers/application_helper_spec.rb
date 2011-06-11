require "spec_helper"

describe "ApplicationHelper" do

  context "display errors for" do
    it "should render error partial when error present on field" do
      errors = {:email => "Email can't be blank"}
      expected_response = controller.render_to_string(:partial => 'shared/field_error', :locals => {:errors => errors, :field => :email})

      helper.display_errors_for(:email, errors).should == expected_response
    end

    it "should return nil when error absent on field" do
      errors = {:base => "Error present on base"}

      helper.display_errors_for(:email, errors).should be_nil
    end
  end
end