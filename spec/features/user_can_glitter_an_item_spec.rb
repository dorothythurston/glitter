require "rails_helper"

describe "User glitters an item" do
  scenario "succesfully" do
    user = create(:user)
    visit root_path(as: user)
    create_item(example_text)
    sign_out
    other_user = create(:user)
    sign_in(other_user)

    visit user_path(user)
    click_on example_text
    click_button I18n.t('items.show.glitter')

    expect(page).to have_content("glitter: 1")
  end
end
