require "test_helper"

module Notes
  class UpdateTest < Minitest::Spec
    it "updates a Note with valid params" do
      event = Event.first
      note = Note.create(content: "Test Note", event: event)

      params = { content: "New Content" }


      result = Note::Operation::Update.(params: params.merge(event_id: event.id, id: note.id))

      assert_equal result.success?, true
      assert_equal note.reload.content, "New Content"
    end

    it "does not updates a Note with invalid params" do
      event = Event.first
      note = Note.create(content: "Test Note", event: event)

      params = { content: "" }


      result = Note::Operation::Update.(params: params.merge(event_id: event.id, id: note.id))

      assert_equal result.success?, false
      assert_equal result[:model].errors.messages, {:content=>["can't be blank"]}
      assert_equal note.reload.content, "Test Note"
    end
  end
end
