require "rails_helper"

RSpec.feature "Users#create", type: :feature do
  let!(:country) { create(:country) }
  let(:user) { build(:user) }

  scenario "Register user with valid attributes" do
    valid_attributes

    expect(page).to have_current_path vaccinations_path
  end

  scenario "Register user without email" do
    no_email

    expect(page).to have_current_path user_registration_path
    expect(page).to have_content("Email can't be blank")
  end

  scenario "Register user with invalid password" do
    invalid_password

    expect(page).to have_current_path user_registration_path
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end

def valid_attributes
  visit new_user_registration_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  fill_in "user_password_confirmation", with: user.password_confirmation
  click_button "Register"
end

def no_email
  visit new_user_registration_path
  fill_in "user[password]", with: user.password
  fill_in "user[password_confirmation]", with: user.password_confirmation
  click_button "Register"
end

def invalid_password
  visit new_user_registration_path
  fill_in "user[email]", with: user.email
  fill_in "user[password]", with: "invalidpasword"
  click_button "Register"
end
