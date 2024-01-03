require "test_helper"

class UpdateTest < Minitest::Spec
  it "updates an Event row" do
    event = Event.create(title: "Test Event", status: "draft", date_from: "2018-01-01", date_to: "2018-01-02")
    params = {
      title: "New title",
      status: "draft",
      date_from: "2018-01-01",
      date_to: "2018-01-02"
    }

    result = Event::Operation::Update.(params: params.merge(id: event.id))

    assert_equal result.success?, true
    assert_equal event.reload.title, "New title"
  end

  it "does not update an Event with invalid params" do
    event = Event.create(title: "Test Event", status: "draft", date_from: "2018-01-01", date_to: "2018-01-02")
    params = {
      title: "",
      status: "draft",
      date_from: "2018-01-01",
      date_to: "2018-01-02"
    }

    result = Event::Operation::Update.(params: params.merge(id: event.id))

    assert_equal result.success?, false
    assert_equal result["model"].errors.messages, {:title=>["can't be blank"]}
    assert_equal event.reload.title, "Test Event"
  end
end
