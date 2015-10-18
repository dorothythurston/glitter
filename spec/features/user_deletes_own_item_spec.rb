require "rails_helper"

feature "User deletes item" do
  scenario "successfully" do
    user = create(:user)
    visit root_path(as: user)

    create_item(example_text)
    click_button I18n.t('items.show.destroy')

    expect(page).not_to have_content(example_text)
  end
end

