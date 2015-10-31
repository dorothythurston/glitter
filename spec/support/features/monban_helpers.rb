module Features
  module MonbanHelpers
    def sign_in_with(email, password)
      visit new_session_path
      fill_in 'session_email', with: email
      fill_in 'session_password', with: password
      click_button I18n.t('sessions.new.submit')
    end

    def sign_up_with(email, password)
      visit new_user_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button I18n.t('users.new.submit')
    end

    def signed_in_user
      password = 'password'
      user = create(:user, password_digest: password)
      sign_in_with user.email, password
      user
    end

    def user_should_be_signed_in
      visit root_path
      expect(page).to have_content I18n.t('application.header.sign_out')
    end

    def user_click_sign_out
      click_link I18n.t('application.header.sign_out')
    end

    def user_should_be_signed_out
      expect(page).to have_content I18n.t('application.header.sign_in')
    end
  end
end

RSpec.configure do |config|
  config.include Features::MonbanHelpers
end
