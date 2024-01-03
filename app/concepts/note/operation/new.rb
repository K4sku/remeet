module Note::Operation
  class New < Trailblazer::Operation
    step :find_event
    step :initialize_model

    private

    def find_event(ctx, params:, **)
      ctx[:event] = Event.find(params[:event_id])
    end

    def initialize_model(ctx, event:, **)
      ctx[:model] = event.notes.build
    end
  end
end
