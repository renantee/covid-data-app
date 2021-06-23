require "rails_helper"

RSpec.feature "Vaccinations#import", type: :feature do
  let(:country) { create(:country) }
  let(:admin) { create(:user, country_id: country.id, is_admin: true) }

  scenario "Admin user imports CSV Data" do
    sign_in_as admin
    visit vaccinations_path
    attach_file("file", "spec/fixtures/files/vaccination-data.csv")
    click_button "Import CSV"

    expect(page).to have_current_path root_path
    expect(page).to have_content "CSV data has been successfully saved."
  end

  scenario "Admin user did not choose a file to import" do
    sign_in_as admin
    visit vaccinations_path
    click_button "Import CSV"

    expect(page).to have_current_path vaccinations_path
    expect(page).to have_content "You must choose a file to import!"
  end
end
