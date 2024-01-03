module Event::Operation
  class Update < Trailblazer::Operation
    step Model::Find(Event, find_by: :id) # it calls ctx[:model] = Event.find_by(id: params[:id])
    step :validate_form
    left :add_error_messages_to_model
    step :update_model

    private

    def validate_form(ctx, params:, **)
      ctx[:form] = EventForm.new(params)
      ctx[:form].validate
    end

    def add_error_messages_to_model(_ctx, model:, form:, **)
      model.errors.merge!(form.errors)
    end

    def update_model(_ctx, model:, params:, **)
      model.update(params)
    end
  end
end
