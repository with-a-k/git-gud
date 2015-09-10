ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest'
require 'minitest/autorun'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid => '123545',
    :info => {
      :email => 'with_a_k@mac.com',
      :nickname => 'with-a-k',
      :image_url => 'https://scontent.cdninstagram.com/hphotos-xaf1/l/t51.2885-15/s150x150/e15/11910403_484109791762117_452611898_n.jpg'
    },
    :credentials => {
      :token => 'an-obviously-fake-token'
    }
  })

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end
end
