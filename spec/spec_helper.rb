require 'usuallynote'
require 'vcr'
require 'pry'
# Dir['./spec/support/**/*.rb'].each { |f| require f }

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end
RSpec.configure do |config|
  #http://robots.thoughtbot.com/how-to-stub-external-services-in-tests
  # config.before(:each) do
  #   stub_request(:any, /(.*).agilecrm.com/).to_rack(FakeAgileCRM)
  # end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
