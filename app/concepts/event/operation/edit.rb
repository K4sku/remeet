module Event::Operation
  class Edit < Trailblazer::Operation
    step Model::Find(Event, find_by: :id) # it calls ctx[:model] = Event.find_by(id: params[:id])
  end
end
