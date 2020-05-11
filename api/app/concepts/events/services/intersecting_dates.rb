module Events
  module Services
    # Finds events with intersecting date range
    # Maybe verbose and not in Rails style but more testable
    class IntersectingDates
      def initialize(date_start, date_end, event)
        @date_start = date_start
        @date_end = date_end
        @event = event
      end

      # @return Array[<Date>] dates for which events already exist
      def call
        # TODO: add pagination (for many count of events)
        other_events = Events::Queries::InRangeQuery.new(@date_start, @date_end, @event).results

        other_events
          .map { |event| Range.new(event.date_start, event.date_end).to_a }
          .flatten
          .uniq
      end
    end
  end
end
