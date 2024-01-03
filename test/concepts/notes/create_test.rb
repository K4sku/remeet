require "test_helper"

module Notes
  class CreateTest < Minitest::Spec
    it "creates a Note row with valid params" do
      event = Event.first
      params = { content: "Test Note" }

      result = Note::Operation::Create.(params: params.merge(event_id: event.id))

      assert_equal result.success?, true
    end

    it "does not create Note with invalid params" do
      event = Event.first
      params = { content: "" }

      result = Note::Operation::Create.(params: params.merge(event_id: event.id))

      assert_equal result.success?, false
      assert_equal result[:model].errors.messages, {:content=>["can't be blank"]}
    end
  end
end
