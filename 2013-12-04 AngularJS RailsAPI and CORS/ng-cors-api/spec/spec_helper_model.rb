require_relative "spec_helper_unit"

ENV["RAILS_ENV"] ||= "test"

# ActiveRecord
require "yaml"
require "active_record"
ActiveRecord::Base.establish_connection(
  YAML.load(File.read(RAILS_ROOT + "config/database.yml"))["test"]
)

require 'factory_girl'
FactoryGirl.find_definitions
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

require "database_cleaner"
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# Enter database configurations into ActiveRecord
ActiveRecord::Base.send(:configurations=, YAML::load(ERB.new(IO.read(RAILS_ROOT + "config/database.yml")).result))
