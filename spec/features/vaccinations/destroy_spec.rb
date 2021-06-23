require "rails_helper"

RSpec.feature "Vaccinations#destroy", type: :feature do
  let(:country) { create(:country) }
  let(:admin) { create(:user, country_id: country.id, is_admin: true) }
  let!(:vaccinations) { create_list(:vaccination, 5, country: country) }

  scenario "Admin user deletes all CSV Data" do
    sign_in_as admin
    visit vaccinations_path
    click_link "Delete All"

    expect(page).to have_current_path root_path
    expect(page).to have_content "CSV data has been successfully deleted."
  end
end
