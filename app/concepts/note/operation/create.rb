module Note::Operation
  class Create < Trailblazer::Operation
    step :find_event
    step :initialize_model
    step :validate_form
    left :add_error_messages_to_model
    step :save_model

    private

    def find_event(ctx, params:, **)
      ctx[:event] = Event.find(params[:event_id])
    end

    def initialize_model(ctx, event:, params:, **)
      ctx[:model] = event.notes.build(params)
    end

    def validate_form(ctx, params:, **)
      ctx[:form] = NoteForm.new(params)
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
