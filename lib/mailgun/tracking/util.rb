# frozen_string_literal: true

module Mailgun
  module Tracking
    # Utility methods.
    module Util
      class << self
        # Converts a hash of fields or an array of hashes into a {Payload}.
        #
        # @param data [Hash, Array] Hash of fields and values to be converted into a Payload.
        #
        # @return [Mailgun::Tracking::Payload, Array(Mailgun::Tracking::Payload)]
        def convert_to_payload_object(data)
          case data
          when Array
            data.map { |item| convert_to_payload_object(item) }
          when Hash
            Payload.new(data)
          else
            data
          end
        end
      end

      class << self
        # Returns a new hash with all keys converted to symbols in downcase.
        #
        # @param options [Hash]
        #
        # @return [Hash]
        def normalize(options = {})
          object = normalize_keys(options.dup)
          object
        end

        private

        def normalize_keys(options)
          return from_h(options) if options.is_a?(Hash)
          return from_ary(options) if options.is_a?(Array)

          options
        end

        def from_h(options)
          Hash[options.map do |key, value|
            [underscore(key), normalize_keys(value)]
          end]
        end

        def from_ary(options)
          options.map(&method(:normalize_keys))
        end

        def underscore(key)
          return key unless key.respond_to?(:to_sym)

          key.to_s
             .dup
             .tr('-', '_')
             .downcase
             .to_sym
        end
      end
    end
  end
end
