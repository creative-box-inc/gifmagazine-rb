module Gifmagazine
  class Response
    def initialize(faraday_response)
      @header = faraday_response.headers
      @body = faraday_response.body
      @status = faraday_response.status
    end

    def body
      @body
    end

    def header
      @header
    end

    def status
      @status
    end

  end
end