require "flatland/client/version"
require 'faraday'

module Flatland
  class Client
    attr_reader :duration, :exit_code

    def self.do(command)
      new.do(command)
    end

    def do(command)
      time { system(command) }

      post duration: duration
    end

    private

    def time(&block)
      started_at = Time.now
      yield
      finished_at = Time.now

      @duration  = (finished_at - started_at).round(0)
      @exit_code = $?.exited? ? $?.exitstatus : nil
    end

    def post(data)
      endpoint.post do |req|
        req.url '/builds'
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def endpoint
      @endpoint ||= Faraday.new(url: 'http://example.com') do |faraday|
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end
