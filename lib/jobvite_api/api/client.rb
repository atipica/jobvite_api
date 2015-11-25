module JobviteApi
  class Client
    include HTTMultiParty
    include JobviteApi::Base
    attr_accessor :api_key, :api_token
    base_uri 'https://api.jobvite.com/api/v2'

    def initialize(api_token = nil, api_key = nil)
      @api_token = api_token || JobviteApi.configuration.api_token
      @api_key = api_key || JobviteApi.configuration.api_key
    end

    def add_authentication_options(options)
      options.merge(api: @api_key, sc: @api_token, format: 'json')
    end

    def candidates(id = nil, options = { page: 1, per_page: 500 })
      page = options.delete(:page)
      per_page = options.delete(:per_page)
      options[:start] = (page - 1) * per_page
      options[:count] = per_page
      options[:candidateId] = id unless id.nil?
      response = get_from_jobvite_api '/candidate', options
      response[:candidates]
    end

    def total
      options = {}
      page = 1
      per_page = 5
      options[:start] = (page - 1) * per_page
      options[:count] = per_page
      response = get_from_jobvite_api '/candidate', options
      response[:total]
    end

    def get_from_jobvite_api(url, options = {})
      response = get_response(url, query: add_authentication_options(options))
      if response.code == 200
        parse_json(response)
      else
        raise StandardError.new(response.code)
      end
    end
  end
end
