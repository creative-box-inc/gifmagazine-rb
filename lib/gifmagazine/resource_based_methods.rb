module Gifmagazine
  module ResourceBasedMethods
    def gifs_search(params={}, headers=nil)
      get("/v1/gifs/search", params, headers)
    end

    def gifs_emotion(params={}, headers=nil)
      get("/v1/gifs/emotion", params, headers)
    end

    def feeds_pickup(params={}, headers=nil)
      get("/v1/feeds/pickup", params, headers)
    end

    def feeds_topic(params={}, headers=nil)
      get("/v1/feeds/topic", params, headers)
    end

    def feeds_jumble(params={}, headers=nil)
      get("/v1/feeds/jumble", params, headers)
    end
  end
end