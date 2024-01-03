class NoteForm
  include ActiveModel::Model

  attr_accessor :content

  validates :content, presence: true

  def attributes
    { content: content }
  end
end