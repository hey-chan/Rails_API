# Setting up before and after I do my tests
RSpec.configure do |config| 
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  # we need the before / after all because with out the data will persist across all the test suites.
  # For edge cases we need to make sure we clean up our hooks after each.
  config.before(:all) do
    DatabaseCleaner.start
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
end