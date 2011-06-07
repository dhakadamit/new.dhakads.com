require 'spec_helper'

describe User do

  context "validation" do
    context "for name" do
      it { should validate_presence_of(:name) }
    end

    context "for email" do
      it { should validate_presence_of :email }

      subject { Factory :admin }
      it { should validate_uniqueness_of(:email) }

      context "format" do
        it { should_not allow_value("a").for(:email) }
        it { should_not allow_value("a@.com").for(:email) }
        it { should_not allow_value("a.com").for(:email) }
        it { should allow_value("abc123@gmail.com").for(:email) }
        it { should allow_value("abc.123@gmail.com").for(:email) }
      end
    end

    context "for phone number" do
      it { should validate_presence_of :phone_number }
      it { should validate_numericality_of(:phone_number) }
      it { should ensure_length_of(:phone_number).is_at_least(7).is_at_most(15) }
    end

    context "for password" do

      context "when account is active" do
        context "format" do
          subject { @account = Factory.build(:admin) }

          it { should_not allow_value("pass").for(:password) }
          it { should_not allow_value("password").for(:password) }
          it { should_not allow_value("123456789").for(:password) }
          it { should allow_value("password123").for(:password) }
          it { should allow_value("p@ssw0rd123").for(:password) }
          it { should allow_value("p@ssword@123").for(:password) }
        end
      end

      context "presence" do
        it "should not validate when account is inactive" do
          @inactive_account = Factory.build(:inactive_admin, :password => nil)
          @inactive_account.save

          @inactive_account.errors[:password].should be_empty
        end

        it "should validate when account is active" do
          @active_account = Factory.build(:admin, :password => nil)
          @active_account.save

          @active_account.errors[:password].should_not be_empty
        end
      end



    end

  end

end
