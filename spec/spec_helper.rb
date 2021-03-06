$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'igdb'
require 'vcr'
require 'simplecov'

SimpleCov.start

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
  config.filter_sensitive_data('<IGDB_KEY>') { ENV['IGDB_KEY'] }
end
