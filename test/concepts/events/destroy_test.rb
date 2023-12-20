require "test_helper"

class DestroyTest < Minitest::Spec
  it "destroys an Event row" do
    old_event_count = Event.count
    event = Event.create(title: "Test Event", status: "draft", date_from: "2018-01-01", date_to: "2018-01-02")

    result = Event::Operation::Destroy.(event_id: event.id)

    assert_equal result.success?, true
    assert_equal Event.count, old_event_count
  end
end
