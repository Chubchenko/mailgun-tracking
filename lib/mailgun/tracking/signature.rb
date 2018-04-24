require 'openssl'

module Mailgun
  module Tracking
    # A Mailgun::Tracking::Signature object is used to verify the signature.
    class Signature
      # Verify the signature of the response parameters.
      #
      # @param payload [Hash]
      # @raise [InvalidSignature] Error raised when signature is invalid.
      #
      # @return [Boolean]
      #   Always returns true.
      def self.verify!(payload)
        signature = new(payload)
        raise InvalidSignature unless signature.valid?
        true
      end

      # Initializes a new Signature object.
      #
      # @param payload [Hash]
      #
      # @return [Mailgun::Tracking::Signature]
      def initialize(payload)
        @token = payload['token']
        @timestamp = payload['timestamp']
        @signature = payload['signature']
      end

      # @return [Boolean]
      def valid?
        @signature == OpenSSL::HMAC.hexdigest(digest, Configuration.instance.api_key, data)
      end

      private

      # @return [OpenSSL::Digest::SHA256]
      def digest
        OpenSSL::Digest::SHA256.new
      end

      # Joins the timestamp and the response token.
      #
      # @return [String]
      def data
        [@timestamp, @token].join
      end
    end
  end
end
