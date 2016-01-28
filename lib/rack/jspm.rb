require "rack/jspm/version"

module Rack
  class Jspm

    attr_reader :app, :options

    def initialize(app, options = {})
      @app = app
      @options = { max_age: 3600 }.merge(options)
    end

    def call(env)
      status, headers, body = @app.call(env)
      case env['PATH_INFO']
        when %r{/jspm_packages/[^/]+/}
          headers = headers.merge(cache_control)
      end
      p env['PATH_INFO'], headers
      [status, headers, body]
    end

    def max_age
      options.fetch(:max_age)
    end

    def cache_control
      { 'Cache-Control' => "max-age=#{max_age}, public" }
    end

  end
end
