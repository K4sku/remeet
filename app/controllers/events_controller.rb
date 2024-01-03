class EventsController < ApplicationController

  # GET /events
  def index
    result = Event::Operation::Index.call
    @events = result[:models]
  end

  # GET /events/1
  def show
    result = Event::Operation::Show.call(params: params)
    @event = result[:model]
    @notes = result[:notes]
  end

  # GET /events/new
  def new
    result = Event::Operation::New.call
    @event = result[:model]
  end

  # GET /events/1/edit
  def edit
    result = Event::Operation::Edit.call(params: params)
    @event = result[:model]
  end

  # POST /events
  def create
    result = Event::Operation::Create.call(params: event_params)
    @event = result[:model]

    if result.success?
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    result = Event::Operation::Update.call(params: event_params.merge(id: params[:id]))
    @event = result[:model]

    if result.success?
      redirect_to @event, notice: "Event was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    result = Event::Operation::Destroy.call(params: params)
    @event = result[:model]

    if result.success?
      redirect_to events_url, notice: "Event was successfully destroyed.", status: :see_other
    else
      redirect_to @event, alert: "Event was not destroyed."
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title, :description, :status, :date_from, :date_to)
    end
end
