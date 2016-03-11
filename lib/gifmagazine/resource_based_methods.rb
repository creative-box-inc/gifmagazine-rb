module Gifmagazine
  module ResourceBasedMethods
    def search(params={}, headers=nil)
      get("/v1/gifs/search", params, headers)
    end

    def emotion(params={}, headers=nil)
      get("/v1/gifs/emotion", params, headers)
    end
  end
end