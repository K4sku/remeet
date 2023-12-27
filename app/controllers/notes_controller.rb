class NotesController < ApplicationController
  # GET /notes
  def index
    @event = Event.find(params[:event_id])
    @notes = @event.notes
  end

  # GET /notes/1
  def show
    @event = Event.find(params[:event_id])
    @note = @event.notes.find(params[:id])
  end

  # GET /notes/new
  def new
    @event = Event.find(params[:event_id])
    @note = @event.notes.build
  end

  # GET /notes/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @note = @event.notes.find(params[:id])
  end

  # POST /notes
  def create
    @event = Event.find(params[:event_id])
    @note = @event.notes.build(note_params)

    if @note.save
      redirect_to event_note_path(@event, @note), notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    @event = Event.find(params[:event_id])
    @note = @event.notes.find(params[:id])
    if @note.update(note_params)
      redirect_to event_note_path(@event, @note), notice: "Note was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @event = Event.find(params[:event_id])
    @note = @event.notes.find(params[:id])
    @note.destroy!
    redirect_to event_path(@event), notice: "Note was successfully destroyed.", status: :see_other
  end

  private

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:content)
    end
end
