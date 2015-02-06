require 'spec_helper'
require 'rails_helper'

describe "User" do
  let(:user) { User.create!(email: "test@test.com", first_name: "test", last_name: "test", password: "test") }

  describe User do
    it { should validate_uniqueness_of (:email) }
  end


  describe "#create" do
    it "creates a new User object" do
      expect(user).to be_a User
    end
  end

  describe ".authenticate" do
    xit "successfuly authenticate a valid user" do
      expect(User.authenticate("test@test.com", "test")).to be_a User
    end

    it "doesn't authenticate a invalid user" do
      expect(User.authenticate("test@test.com", "wrong_password")).to be_falsy
    end
  end

end
