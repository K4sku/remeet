require "test_helper"

class NewTest < Minitest::Spec
  it "returns an Event row" do
    result = Event::Operation::New.()

    assert_equal result.success?, true
    assert_equal result["model"].class, Event
  end
end
