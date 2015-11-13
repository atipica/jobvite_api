# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rubygems'
require 'bundler'
require 'webmock/rspec'
require 'vcr'
require 'httmultiparty'
require 'multi_json'
require 'jobvite_api'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

def restore_default_config
  JobviteApi.configuration = nil
  JobviteApi.configure {}
  JobviteApi.configuration.symbolize_keys = true
end
