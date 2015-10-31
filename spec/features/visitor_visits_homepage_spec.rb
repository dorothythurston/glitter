require "rails_helper"

feature "Visitor visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_content I18n.t('homes.show.welcome_text')
  end
end
