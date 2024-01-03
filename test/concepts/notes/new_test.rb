require "test_helper"

module Notes
  class NewTest < Minitest::Spec
    it "returns a Note row" do
      event = Event.first
      result = Note::Operation::New.(params: { event_id: event.id })

      assert_equal result.success?, true
      assert_equal result["model"].class, Note
    end
  end
end
