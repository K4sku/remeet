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
end
