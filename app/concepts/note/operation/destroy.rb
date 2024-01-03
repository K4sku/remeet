module Note::Operation
  class Destroy < Trailblazer::Operation
    step :find_event
    step :find_model
    step :destroy_model

    private

    def find_event(ctx, params:, **)
      ctx[:event] = Event.find(params[:event_id])
    end

    def find_model(ctx, event:, params:, **)
      ctx[:model] = event.notes.find(params[:id])
    end

    def destroy_model(_ctx, model:, **)
      model.destroy
    end
  end
end
