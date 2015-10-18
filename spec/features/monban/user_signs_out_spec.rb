require 'rails_helper'

feature 'User signs out' do
  scenario 'sucessfully' do
    user = signed_in_user
    user_click_sign_out

    user_should_be_signed_out
  end
end
