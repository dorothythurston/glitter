require 'rails_helper'

describe "User can view items on dashboard" do
  scenario "successfully" do
    user = create(:user)
    visit root_path(as:user)
    create_item(example_text)

    visit root_path
    expect(page).to display_item("#{user.email} created a new post")
  end
end
