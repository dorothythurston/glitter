require 'rails_helper'

feature "User that follows another user receives followed users latest activities" do
  scenario "successfully" do
    user_that_makes_activity = create(:user)
    user = create(:user)

    visit root_path(as: user_that_makes_activity)
    create_item(example_text)
    sign_out
    visit root_path(as: user)
    visit user_path(user_that_makes_activity)
    click_button I18n.t('users.show.follow')
    visit root_path

    expect(page).to have_content("#{I18n.t('following_relationship_activities.following_relationship_activity.you')} " "#{I18n.t('following_relationship_activities.following_relationship_activity.followed')} " "#{user_that_makes_activity.username}")
    expect(page).to have_content("#{user_that_makes_activity.username} " "#{I18n.t('item_activities.item_activity.made_new')} " "#{I18n.t('item_activities.item_activity.post')}")
  end
end
