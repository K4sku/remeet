class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  def create
    result = Event::Operation::Create.call(params: event_params.mer)
    @event = result[:model]

    if result.success?
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    result = Event::Operation::Update.call(params: event_params, event_id: params[:id])
    @event = result[:model]

    if result.success?
      redirect_to @event, notice: "Event was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_url, notice: "Event was successfully destroyed.", status: :see_other
  end

  private
    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title, :description, :status, :date_from, :date_to)
    end
end
