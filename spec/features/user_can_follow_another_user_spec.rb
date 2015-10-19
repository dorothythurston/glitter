require 'rails_helper'

feature "User can follow another user" do
  scenario "successfully" do
    other_user = create(:user)
    user = create(:user)

    visit root_path(as: user)
    visit user_path(other_user)
    click_button I18n.t('users.show.follow')

    expect(page).to have_button(I18n.t('users.show.unfollow'))
  end
end
