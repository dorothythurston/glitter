module Requests
  module JsonHelpers
    API_TOKEN_HEADER = "X-API-TOKEN".freeze
    JSON_HEADERS = {
      "X-ACCESS-TOKEN" => ENV.fetch("ACCESS_TOKEN"),
    }.freeze

    def json_response
      JSON.parse(response.body)
    end

    def json_get(*args)
      path, params, headers_with_auth = process_arguments(*args)
      get(path, params, headers_with_auth)
    end

    def json_post(*args)
      path, params, headers_with_auth = process_arguments(*args)
      post(path, params, headers_with_auth)
    end

    def json_headers(headers = {})
      JSON_HEADERS.reverse_merge(headers)
    end

    private
    def process_arguments(path, params = {}, headers_or_env = {})
      api_token_headers = { API_TOKEN_HEADER =>  params.delete(:api_token) }
      headers_with_api_token = headers_or_env.merge(api_token_headers)
      [path, params, json_headers(headers_with_api_token)]
    end
  end
end
