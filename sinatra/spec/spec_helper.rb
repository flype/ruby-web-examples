ENV['RACK_ENV'] = 'test'
require_relative '../boot'

require 'capybara/rspec'

Capybara.app = ThingsTodo::Application

RSpec.configure do |config|
  config.before do
    ThingsTodo::DB::TodoModel.destroy_all
  end
end
