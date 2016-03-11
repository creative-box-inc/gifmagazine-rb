require 'gifmagazine/version'
require 'uri'
require 'gifmagazine/response'
require 'gifmagazine/resource_based_methods'

module Gifmagazine
  class Client
    DEFAULT_ACCEPT = "application/json"

    DEFAULT_HOST = "api.gifmagazine.net"

    DEFAULT_USER_AGENT = "Gifmagazine Ruby Gem #{Gifmagazine::VERSION}"

    DEFAULT_HEADERS = {
      "Accept" => DEFAULT_ACCEPT,
      "User-Agent" => DEFAULT_USER_AGENT
    }

    include ResourceBasedMethods

    def initialize(options={})
      @opts = {
        token: nil
      }.merge!(options)
    end

    def get(path, params={}, headers=nil)
      request(:get, path, params, headers)
    end

    def con
      @connection ||= Faraday.new(faraday_client_options) do |connection|
        connection.request :json
        connection.response :json
        connection.adapter Faraday.default_adapter
      end
    end

    private
    def faraday_client_options
      {
        headers: DEFAULT_HEADERS,
        url: url_prefix
      }
    end

    def url_prefix
      "http://#{DEFAULT_HOST}"
    end

    def merged_params(params)
      unless @opts[:token].nil?
        params.merge!({token: @opts[:token]})
      end
      params
    end

    def request(request_method, path, params, headers)
      Gifmagazine::Response.new(
        con.send(
          request_method,
          URI.escape(path),
          merged_params(params),
          headers
        )
      )
    end
  end
end