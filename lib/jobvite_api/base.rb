module JobviteApi
  module Base
    def get_response(url, options)
      self.class.get(url, options)
    end

    def post_response(url, options)
      self.class.post(url, options)
    end

    def parse_json(response)
      MultiJson.load(response.body, symbolize_keys:
        JobviteApi.configuration.symbolize_keys)
    end
  end
end
