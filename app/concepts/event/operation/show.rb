module Event::Operation
  class Show < Trailblazer::Operation
    step :find_model
    step :find_notes

    private

    def find_model(ctx, params:, **)
      ctx[:model] = Event.includes(:notes).find(params[:id])
    end

    def find_notes(ctx, model:, **)
      ctx[:notes] = model.notes
    end
  end
end
