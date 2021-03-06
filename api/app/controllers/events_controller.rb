class EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  wrap_parameters :event, include: %i[title date_start date_end]

  # GET /events
  def index
    @pagy, @events = pagy(Event.all)
    pagy_headers_merge(@pagy)
    @events
  end

  # GET /events/1
  def show; end

  # POST /events
  def create
    @event = Events::Services::Add.new(event_params).call

    if @event.persisted?
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if Events::Services::Update.new(@event, event_params).call
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    Events::Services::Delete.new(@event).call
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    p params
    params.permit(:title, :date_start, :date_end)
  end
end
