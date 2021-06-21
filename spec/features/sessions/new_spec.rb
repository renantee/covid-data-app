require "rails_helper"

RSpec.feature "Sessions#new", type: :feature do
  scenario "User visits Login page" do
    visit root_path
    click_link "Login"

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_css("h2.header")
    expect(page).to have_content "Log in"
  end
end
