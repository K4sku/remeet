require "test_helper"

class CreateTest < Minitest::Spec
  it "creates an Event row" do
    params = {
      title: "Test Event",
      status: "draft",
      date_from: "2018-01-01",
      date_to: "2018-01-02",
    }
    result = Event::Operation::Create.(params: params)

    assert_equal result.success?, true
  end

  it "does not create Event with invalid params" do
    params = {
      title: "",
      status: "draft",
      date_from: "2018-01-01",
      date_to: "2018-01-02",
    }
    result = Event::Operation::Create.(params: params)

    assert_equal result.success?, false
    assert_equal result[:model].errors.messages, {:title=>["can't be blank"]}
  end
end
