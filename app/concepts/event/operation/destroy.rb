module Event::Operation
  class Destroy < Trailblazer::Operation
    step Model::Find(Event, find_by: :id) # it calls ctx[:model] = Event.find_by(id: params[:id])
    step :destroy_model

    private

    def destroy_model(_ctx, model:, **)
      model.destroy
    end
  end
end
