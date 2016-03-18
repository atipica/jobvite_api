module JobviteApi
  module Base
    def get_response(url, options)
      self.class.get(url, options)
    end

    def post_response(url, options)
      self.class.post(url, options)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names:
        JobviteApi.configuration.symbolize_keys)
    end
  end
end
