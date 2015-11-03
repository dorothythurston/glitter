require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'validusername','valid@example.com', 'password'

    user_should_be_signed_in
  end

  scenario 'tries with invalid email' do
    sign_up_with 'validusername', 'invalid_email', 'password'

    user_should_be_signed_out
  end

  scenario 'tries with invalid username' do
    sign_up_with 'morethanfifteencharacters','valid@example.com', 'password'

    user_should_be_signed_out
  end

  scenario 'tries with blank password' do
    sign_up_with 'validusername','valid@example.com', ''

    user_should_be_signed_out
  end
end
