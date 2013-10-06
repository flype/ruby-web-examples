require 'capybara/rspec'
require_relative '../boot'

Capybara.app = ThingsTodo::Application

RSpec.configure do |config|
  config.before do
    ThingsTodo::DB::TodoModel.destroy_all
  end
end
