module Event::Operation
  class Destroy < Trailblazer::Operation
    step Model::Find(Event, find_by: :id)
    step :destroy_model

    private

    def destroy_model(_ctx, model:, **)
      model.destroy
    end
  end
end
