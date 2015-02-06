require 'spec_helper'
require 'rails_helper'

describe "User Features" do
  describe "Sign up" do
    feature 'user can sign up' do
      scenario 'with valid email and password' do
        visit '/signup'
        within(:css, 'div#signup_form') do
          fill_in 'Email', with: 'test@test.com'
          fill_in 'First name', with: 'test'
          fill_in 'Last name', with: 'test'
          fill_in 'Password', with: 'test'
        end
        click_button 'Sign up'

        # save_and_open_page
      end
    end
  end

  describe "Log in" do
    feature 'user can log in' do
      scenario 'with valid email and password' do
        User.create!(email: "email@test.com", password: "test")
        visit '/'
        fill_in 'Email', with: 'email@test.com'
        fill_in 'Password', with: 'test'
        click_button 'Log in'

        # save_and_open_page
      end
    end
  end
end
