# frozen_string_literal: true

require 'bundler/setup'
require 'c_ray'

require 'simplecov'
SimpleCov.start do
  add_filter %r{^/spec/}

  add_group 'Domain', 'domain'
  add_group 'Persistence', 'persistence'

  SimpleCov.minimum_coverage 85
  SimpleCov.minimum_coverage_by_file 75
end

require 'factory_bot'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4.
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # This option will default to `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 and will have no way to turn it off
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = './.rspec_status'
  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  Kernel.srand config.seed
end
