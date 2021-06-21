require "rails_helper"

RSpec.feature "Users#new", type: :feature do
  let!(:country) { create(:country) }

  scenario "Guest user visits registration page" do
    visit root_path
    click_link "Register"

    expect(page).to have_current_path new_user_registration_path
    expect(page).to have_text("Register")
    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
    expect(page).to have_button("Register")
  end
end
