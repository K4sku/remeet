module Event::Operation
  class Index < Trailblazer::Operation
    step :find_models

    private

    def find_models(ctx, **)
      ctx[:models] = Event.all.includes(:notes)
    end
  end
end
