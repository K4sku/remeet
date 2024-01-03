module Event::Operation
  class Edit < Trailblazer::Operation
    step Model::Find(Event, find_by: :id)
  end
end
