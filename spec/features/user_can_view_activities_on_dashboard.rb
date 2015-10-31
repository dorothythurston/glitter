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

  scenario "followed user successfully glitters item" do
    user_that_creates_item = create(:user)
    user_that_glitters_item = create(:user)
    user_that_creates_item.follow(user_that_glitters_item)
    user_that_glitters_item.follow(user_that_creates_item)
    item = create(:item, user_id: user_that_creates_item.id, text: example_text)

    visit root_path(as: user_that_glitters_item)
    visit user_path(user_that_creates_item)
    click_on example_text
    click_button I18n.t('items.show.glitter')
    sign_out

    visit root_path(as: user_that_creates_item)
    expect(page).to have_content("#{user_that_glitters_item.email} #{I18n.t('glittering_activities.glittering_activity.glittered')} #{I18n.t('glittering_activities.glittering_activity.post')}")
  end
end
