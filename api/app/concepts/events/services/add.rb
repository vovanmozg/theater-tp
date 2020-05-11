module Events
  module Services
    # Adds event
    class Add
      def initialize(params)
        @params = params
      end

      def call
        event = Event.new(@params)
        event.save
        event
      end
    end
  end
end
