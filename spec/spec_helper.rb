require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end

Spork.each_run do
  require 'rspec/rails'
  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
  end
  require 'factory_girl_rails'
  Dir["#{Rails.root}/app/controllers/*.rb"].each do |controller|
    load controller
  end
  Dir["#{Rails.root}/app/models/*.rb"].each do |model|
    load model
  end
end

