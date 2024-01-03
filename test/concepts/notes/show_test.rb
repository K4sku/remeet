require "test_helper"

module Notes
  class ShowTest < Minitest::Spec
    it "returns a Notes row" do
      event = Event.first
      note = Note.create(content: "Test Note", event: event)

      result = Note::Operation::Show.(params: { event_id: event.id, id: note.id })

      assert_equal result.success?, true
      assert_equal result["model"].id, note.id
    end
  end
end
