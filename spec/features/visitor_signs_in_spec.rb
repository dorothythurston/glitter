require 'rails_helper'

feature 'Visitor signs in' do
  scenario 'with valid email and password' do
    create_user 'user@example.com', 'password'
    sign_in_with 'user@example.com', 'password'

    user_should_be_signed_in
  end

  scenario 'tries with invalid password' do
    create_user 'user@example.com', 'password'
    sign_in_with 'user@example.com', 'wrong_password'

    page_should_display_sign_in_error
    user_should_be_signed_out
  end

  scenario 'tries with invalid email' do
    sign_in_with 'unknown.email@example.com', 'password'

    page_should_display_sign_in_error
    user_should_be_signed_out
  end

  private

  def create_user(email, password)
    create(:user, email: email, password_digest: password)
  end

  def page_should_display_sign_in_error
    expect(page.body).to include(
      I18n.t('flashes.failure_after_create', sign_up_path: new_user_path)
    )
  end
end
