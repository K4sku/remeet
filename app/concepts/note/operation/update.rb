module Note::Operation
  class Update < Trailblazer::Operation
    step :find_event
    step :find_model
    step :validate_form
    left :add_error_messages_to_model
    step :update_model

    private

    def find_event(ctx, params:, **)
      ctx[:event] = Event.find(params[:event_id])
    end

    def find_model(ctx, event:, params:, **)
      ctx[:model] = event.notes.find(params[:id])
    end

    def validate_form(ctx, params:, **)
      ctx[:form] = NoteForm.new(params)
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
