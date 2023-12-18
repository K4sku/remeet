# NOTE: this is one file to start testing with, it will be split into
# separate files as needed,

require "test_helper"

class EventOperationTest < Minitest::Spec
  it "creates an Event row" do
    result = Event::Operation::Create.(params: {})

    assert_equal result.success?, true
  end
end
