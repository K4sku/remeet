module Event::Operation
  class New < Trailblazer::Operation
    step :initialize_model

    private

    def initialize_model(ctx, **)
      ctx[:model] = Event.new
    end
  end
end
