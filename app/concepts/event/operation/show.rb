module Event::Operation
  class Show < Trailblazer::Operation
    step Model::Find(Event, find_by: :id) # it calls ctx[:model] = Event.find_by(id: params[:id])

    private

    def find_notes(ctx, model:, **)
      ctx[:notes] = model.notes.to_a
    end
  end
end
