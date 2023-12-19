module Event::Operation
  class Create < Trailblazer::Operation
    step :initialize_model
    step :validate_form
    left :add_error_messages_to_model
    step :save_model

    private

    def initialize_model(ctx, params:, **)
      ctx[:model] = Event.new(params)
    end

    def validate_form(ctx, params:, **)
      ctx[:form] = EventForm.new(params)
      ctx[:form].validate
    end

    def add_error_messages_to_model(_ctx, model:, form:, **)
      model.errors.merge!(form.errors)
    end

    def save_model(_ctx, model:, **)
      model.save
    end
  end
end
