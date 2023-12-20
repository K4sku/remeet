require "test_helper"

class IndexTest < Minitest::Spec
  it "returns an array of Event rows" do
    result = Event::Operation::Index.()

    assert_equal result.success?, true
    refute_empty result["models"]
  end
end
