# for all of our factory bot tests we want to be able to access the methods to use our data factories. 
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end