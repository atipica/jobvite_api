require 'spec_helper'

describe JobviteApi::Client do
  before do
    JobviteApi.configure do |config|
      config.symbolize_keys = true
    end
    @client = JobviteApi::Client.new('example_api_token', 'example_api_key')
  end
  describe '#candidates' do
    context 'given no id' do
      before do
        VCR.use_cassette('client/candidates') do
          @candidates_response = @client.candidates(nil, page: 1, per_page: 5)
        end
      end

      it 'returns a response' do
        expect(@candidates_response).to_not be_nil
      end

      it 'returns an array of candidates' do
        expect(@candidates_response).to be_an_instance_of(Array)
      end

      it 'returns details of candidates' do
        expect(@candidates_response.first).to have_key(:firstName)
      end
    end
  end
  describe '#total' do
    before do
      VCR.use_cassette('client/candidates') do
        @total_candidates = @client.total
      end
    end

    it 'returns a response' do
      expect(@total_candidates).to_not be_nil
    end

    it 'returns the number of candidates' do
      expect(@total_candidates).to eq 238346
    end
  end
end
