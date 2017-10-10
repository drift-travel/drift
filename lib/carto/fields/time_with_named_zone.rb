module Carto
  module Fields

    # A Mongoid field for storing a time along with its zone.
    module TimeWithNamedZone
      class << self

        # Takes a time-like object and returns a hash with the time adjusted to
        #   UTC and the time zone.
        #
        # @param [ActiveSupport::TimeWithZone,Time,DateTime,Date,Hash] object The time-like object to store.
        # @return [Hash{ time: Time, zone: String}] A hash with the time and zone.
        def mongoize(object)
          case object
          when ActiveSupport::TimeWithZone
            { time: object.utc.mongoize, zone: convert_timezone(object.time_zone.name.mongoize) }
          when Time || DateTime
            { time: object.utc.mongoize, zone: 'UTC'.mongoize }
          when Date
            { time: object.mongoize, zone: 'UTC'.mongoize }
          when Hash
            { time: object[:time], zone: object[:zone] }
          end
        end

        # Take the stored hash with the time and zone and return a correct time.
        #
        # @param [Hash] object The hash with the time and zone.
        # @return [ActiveSupport::TimeWithZone] The time in the correct zone.
        def demongoize(object)
          return nil unless object.is_a? Hash

          object.symbolize_keys!

          return nil unless object[:time] && object[:zone]

          object[:time].in_time_zone(object[:zone])
        end

        alias_method :evolve, :mongoize

        private

        # Maps the timezones to a universal format.
        #
        # @example
        #   convert_timezone('Pacific Time (US & Canada)') # => 'America/Los_Angeles'
        #
        # @param [String] tz The time zone to convert.
        # @return [String, nil] The converted time zone if it could be found, nil otherwise.
        def convert_timezone(tz)
          converted = ActiveSupport::TimeZone::MAPPING[tz]

          return tz if converted.nil?

          converted
        end
      end
    end
  end
end
