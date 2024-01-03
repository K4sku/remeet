require "test_helper"

module Notes
  class EditTest < Minitest::Spec
    it "returns a Note row" do
      event = Event.first
      note = Note.create(content: "Test Note", event: event)

      result = Note::Operation::Edit.(params: { event_id: event.id, id: note.id })

      assert_equal result.success?, true
      assert_equal result["model"].id, note.id
    end
  end
end
