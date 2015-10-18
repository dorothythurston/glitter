require "rails_helper"

feature "User creates item" do
  scenario "successfully" do
    user = create(:user)
    visit root_path(as: user)

    create_item(item_text)

    expect(page).to have_css "p", text: item_text
  end

  private

  def item_text
    "example text"
  end
end
