require "pathname"
require "bundler/setup"

require "active_record"
require "shoulda-matchers"

require "randomized_field"

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

test_dir = Pathname.new(File.dirname(__FILE__))

require test_dir.join("schema", "schema.rb")
require test_dir.join("models", "user.rb")

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random

  # Enable the --seed CLI option to help diagnose bugs surfaced by test suite
  # running in random order.
  Kernel.srand config.seed
end
