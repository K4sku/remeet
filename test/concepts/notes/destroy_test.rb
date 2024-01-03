require "test_helper"

module Notes
  class DestroyTest < Minitest::Spec
    it "destroys a Note" do
      old_note_count = Note.count
      event = Event.first
      note = Note.create(content: "Test Note", event: event)

      result = Note::Operation::Destroy.(params: { event_id: event.id, id: note.id })

      assert_equal result.success?, true
      assert_equal Note.count, old_note_count
    end
  end
end
