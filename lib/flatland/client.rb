require "flatland/client/version"
require 'faraday'

module Flatland
  class Client
    def self.time(command)
      new.time(command)
    end

    def time(command)

      system(command)

      endpoint.post do |req|
        req.url '/builds'
        req.headers['Content-Type'] = 'application/json'
        req.body = '{ "duration": "101" }'
      end
    end

    private

    def endpoint
      @endpoint ||= Faraday.new(url: 'http://example.com') do |faraday|
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

    end
  end
end
