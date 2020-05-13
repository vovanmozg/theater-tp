# Spec with slow: true flag does not run by default
RSpec.describe '/events', type: :request, slow: true, db: true do
  let(:event_instance) { build(:event) }
  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      title: event_instance.title,
      date_start: event_instance.date_start,
      date_end: event_instance.date_end
    }
  end

  let(:invalid_attributes) do
    {
      title: event_instance.title,
      date_start: event_instance.date_start,
      date_end: event_instance.date_start - 1.day
    }
  end

  let(:update_attributes) do
    {
      title: 'New title',
      date_start: event_instance.date_start,
      date_end: event_instance.date_end
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Event.create! valid_attributes
      get events_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event = Event.create! valid_attributes
      get event_url(event), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Event' do
        data = { params: valid_attributes, headers: valid_headers, as: :json }
        expect { post events_url, data }.to change(Event, :count).by(1)
      end

      it 'renders a JSON response with the created status' do
        post events_url,
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
      end

      it 'renders a response with JSON type' do
        post events_url,
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Event' do
        expect do
          post events_url,
               params: invalid_attributes, as: :json
        end.to change(Event, :count).by(0)
      end

      it 'renders a JSON response with :unprocessable_entity status' do
        post events_url,
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a response with JSON type' do
        post events_url,
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested event' do
        event = Event.create! valid_attributes

        patch event_url(event),
              params: update_attributes, headers: valid_headers, as: :json
        event.reload
        expect(event.title).to eq(update_attributes[:title])
      end

      it 'returns OK status' do
        event = Event.create! valid_attributes
        patch event_url(event),
              params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end

      it 'renders a response with JSON type' do
        event = Event.create! valid_attributes
        patch event_url(event),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'renders a response with JSON type' do
        event = Event.create! valid_attributes
        patch event_url(event),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'renders a JSON response with errors for the event' do
        event = Event.create! valid_attributes
        patch event_url(event),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested event' do
      event = Event.create! valid_attributes
      expect do
        delete event_url(event), headers: valid_headers, as: :json
      end.to change(Event, :count).by(-1)
    end
  end
end
