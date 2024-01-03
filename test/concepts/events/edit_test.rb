require "test_helper"

class EditTest < Minitest::Spec
  it "returns an Event row" do
    event = Event.create(title: "Test Event", status: "draft", date_from: "2018-01-01", date_to: "2018-01-02")

    result = Event::Operation::Edit.(params: { id: event.id })

    assert_equal result.success?, true
    assert_equal result["model"].id, event.id
  end
end
