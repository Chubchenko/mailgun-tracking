module Mailgun
  module Tracking
    # Provides a convenient interface to a Rack environment.
    class Request < ::Rack::Request
      # Checks if the request is respond to the specified URL.
      #
      # @return [Boolean]
      def mailgun_tracking?
        return false unless post?
        path == Configuration.instance.endpoint
      end
    end
  end
end
