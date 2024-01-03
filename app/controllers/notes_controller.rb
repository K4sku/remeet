class NotesController < ApplicationController
  # GET /notes/1
  def show
    result = Note::Operation::Show.(params: params) # you can omit #call() and just use .()
    @event = result[:event]
    @note = result[:model]
  end

  # GET /notes/new
  def new
    result = Note::Operation::New.(params: params) # you can omit #call() and just use .()
    @event = result[:event]
    @note = result[:model]
  end

  # GET /notes/1/edit
  def edit
    result = Note::Operation::Edit.(params: params) # you can omit #call() and just use .()
    @event = result[:event]
    @note = result[:model]
  end

  # POST /notes
  def create
    result = Note::Operation::Create.(params: note_params.merge(event_id: params[:event_id]))
    @event = result[:event]
    @note = result[:model]

    if result.success?
      redirect_to event_note_path(@event, @note), notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    result = Note::Operation::Update.(params: note_params.merge(event_id: params[:event_id], id: params[:id]))
    @event = result[:event]
    @note = result[:model]

    if result.success?
      redirect_to event_note_path(@event, @note), notice: "Note was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    result = Note::Operation::Destroy.(params: params)
    @event = result[:event]

    redirect_to event_path(@event), notice: "Note was successfully destroyed.", status: :see_other
  end

  private

  # Only allow a list of trusted parameters through.
  def note_params
    params.fetch(:note, {}).permit(:content)
  end
end
