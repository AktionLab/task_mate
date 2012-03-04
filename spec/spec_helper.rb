require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
require 'rspec/rails'
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end

