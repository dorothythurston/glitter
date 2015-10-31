require 'rails_helper'

describe "User can view activity on dashboard" do
  scenario "followed user successfully creates item" do
    user = create(:user)
    follower = create(:user)
    follower.follow(user)
    visit root_path(as: user)
    create_item(example_text)
    sign_out

    visit root_path(as: follower)
    expect(page).to have_content("#{user.email} #{I18n.t('item_activities.item_activity.made_new')}")
  end

  scenario "followed user successfully follows user" do
    user = create(:user)
    follower = create(:user)
    follower.follow(user)

    visit root_path(as: user)
    visit user_path(follower)
    click_button I18n.t('users.show.follow')
    sign_out

    visit root_path(as: follower)
    expect(page).to have_content("#{user.email} #{I18n.t('following_relationship_activities.following_relationship_activity.followed')} #{follower.email}")
  end
end
