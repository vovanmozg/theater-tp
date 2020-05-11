module Events
  module Queries
    # Finds events with intersecting date diapason
    # Query suffix in class name simplifies files navigation in IDE
    class InRangeQuery
      def initialize(date_start, date_end, event)
        @date_start = date_start
        @date_end = date_end
        @event = event
      end

      def results(scope = Event)
        scope
          .where(date_start: @date_start..@date_end)
          .or(scope.where(date_end: @date_start..@date_end))
          .where.not(id: @event.id)
      end
    end
  end
end
