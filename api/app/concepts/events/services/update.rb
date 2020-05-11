module Events
  module Services
    # Updates event
    class Update
      def initialize(event, params)
        @event = event
        @params = params
      end

      def call
        @event.update(@params)
      end
    end
  end
end
