module Event::Operation
  class Show < Trailblazer::Operation
    step :find_model

    private

    def find_model(ctx, params:, **)
      ctx[:model] = Event.find(params[:id])
    end
  end
end
