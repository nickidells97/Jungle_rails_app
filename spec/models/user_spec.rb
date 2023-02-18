require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    user = User.new(
        name: "user",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
    it "is not valid when email is not present" do 
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid when name is not present" do 
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid when password is not present" do 
      user.password = nil
      user.password_confirmation = nil
      expect(user).to_not be_valid
    end

    it "is not valid when password doesn't match confirmation" do 
      user = User.new(
        name: "user",
        email: "user@email.com",
        password: "goodpassword",
        password_confirmation: "badpassword"
      )
      expect(user).to_not be_valid
    end

    it "is not valid when password is too short" do 
      user = User.new(
        name: "user",
        email: "user@email.com",
        password: "short",
        password_confirmation: "short"
      )
      expect(user).to_not be_valid
    end

    it "downcases an email before saving" do 
      user = User.new(
        name: "user",
        email: "USER@EMAIL.COM",
        password: "password",
        password_confirmation: "password"
      )
      user.save
      expect(user.email).to eq("user@email.com")
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates the user" do 
      user = User.new(
        name: "user",
        email: "USER@EMAIL.COM",
        password: "password",
        password_confirmation: "password"
      )
      user.save
      saved_user = User.authenticate_with_credentials(user.email, user.password)
      expect(saved_user.id).to be_present
    end

    it "Does not authenticates the user" do 
      user = User.new(
        name: "user",
        email: "USER@EMAIL.COM",
        password: "password",
        password_confirmation: "password"
      )
      user.save
      saved_user = User.authenticate_with_credentials("user2@email.com", user.password)
      expect(saved_user).to be_nil
    end

    it "authenticates the user" do 
      user = User.new(
        name: "user",
        email: "USER@EMAIL.COM",
        password: "password",
        password_confirmation: "password"
      )
      user.save
      saved_user = User.authenticate_with_credentials(user.email + " ", user.password)
      expect(saved_user.id).to be_present
    end
  end
end
