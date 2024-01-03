module Event::Operation
  class Destroy < Trailblazer::Operation
    step :find_model
    step :destroy_model

    private

    def find_model(ctx, event_id:, **)
      ctx[:model] = Event.find(event_id)
    end

    def destroy_model(_ctx, model:, **)
      model.destroy
    end
  end
end
