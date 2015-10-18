module Features
  module ItemHelpers
    def create_item(item_text)
      fill_in 'item_text', with: item_text
      click_button I18n.t('items.new.submit')
    end

    def example_text
      "here is some text"
    end
  end
end

RSpec.configure do |config|
  config.include Features::ItemHelpers
end
