require 'rails_helper'

feature 'Visitor signs in' do
  scenario 'with valid email and password' do
    create_user 'user@example.com', 'password'
    sign_in_with 'user@example.com', 'password'

    user_should_be_signed_in
  end

 private

  def create_user(email, password)
    create(:user, email: email, password_digest: password)
  end
end
