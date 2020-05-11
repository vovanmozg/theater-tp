module Events
  module Services
    # Deletes event
    class Delete
      def initialize(event)
        @event = event
      end

      def call
        @event.destroy
      end
    end
  end
end
