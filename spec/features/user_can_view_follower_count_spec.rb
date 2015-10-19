require 'rails_helper'

describe 'User can view follower count' do
  scenario "successfully" do
    user = create(:user)
    followed_user = create(:user)

    sign_in(user)
    visit user_path(followed_user)
    click_button I18n.t('users.show.follow')
    sign_out

    sign_in(followed_user)
    visit user_path(followed_user)

    expect(page).to have_content("1 follower")
  end
end
