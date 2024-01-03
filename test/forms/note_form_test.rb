require "test_helper"

class NoteFormTest < ActiveSupport::TestCase
  def setup
    @form = NoteForm.new
  end

  test "validates presence of content" do
    @form.valid?
    assert_includes @form.errors.details[:content], error: :blank
  end
end
