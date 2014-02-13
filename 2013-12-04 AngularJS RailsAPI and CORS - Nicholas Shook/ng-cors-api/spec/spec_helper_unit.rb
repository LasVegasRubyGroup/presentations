require "pathname"
RAILS_ROOT = Pathname.new(File.expand_path("../..", __FILE__))

# ActiveSupport
require "active_support"
require "active_support/dependencies"
%w{ api helpers mailers models }.each do |dir|
  ActiveSupport::Dependencies.autoload_paths <<
    File.expand_path(RAILS_ROOT + "app/#{dir}", __FILE__)
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[RAILS_ROOT + "spec/support/**/*.rb"].each {|f| require f}
