require 'spec_helper'

describe JobviteApi::Configuration do
  after { restore_default_config }

  context 'when no symbolize_keys is specified' do
    before do
      restore_default_config
    end

    it 'returns the default value' do
      expect(JobviteApi.configuration.symbolize_keys).to be_falsey
    end
  end

  context 'when given a symbolize_keys value' do
    before do
      JobviteApi.configure do |config|
        config.symbolize_keys = true
      end
    end

    it 'returns the specified value' do
      expect(JobviteApi.configuration.symbolize_keys).to be_truthy
    end
  end

  context 'when no api key is specified' do
    before do
      restore_default_config
    end

    it 'returns nil' do
      expect(JobviteApi.configuration.api_key).to be_nil
    end
  end

  context 'when given an api key' do
    before do
      JobviteApi.configure do |config|
        config.api_key = 'API Key of Company'
      end
    end

    it 'returns the specified value' do
      expect(JobviteApi.configuration.api_key).to eq('API Key of Company')
    end
  end

  context 'when no api token is specified' do
    before do
      restore_default_config
    end

    it 'returns nil' do
      expect(JobviteApi.configuration.api_token).to be_nil
    end
  end

  context 'when given an api token' do
    before do
      JobviteApi.configure do |config|
        config.api_token = '123FakeToken'
      end
    end

    it 'returns the specified value' do
      expect(JobviteApi.configuration.api_token).to eq('123FakeToken')
    end
  end
end
