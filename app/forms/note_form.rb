class NoteForm
  include ActiveModel::Model

  attr_accessor :id, :event_id, :content

  validates :content, presence: true

  def attributes
    {
      id: id,
      event_id: event_id,
      content: content
    }
  end
end