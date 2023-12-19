require "test_helper"

class EventFormTest < ActiveSupport::TestCase
  def setup
    @form = EventForm.new
  end

  test "validates presence of title" do
    @form.valid?
    assert_includes @form.errors.details[:title], error: :blank
  end

  test "validates presence of date_from" do
    @form.valid?
    assert_includes @form.errors.details[:date_from], error: :blank
  end

  test "validates presence of date_to" do
    @form.valid?
    assert_includes @form.errors.details[:date_to], error: :blank
  end

  test "validates inclusion of status" do
    @form.status = 'invalid_status'
    @form.valid?
    assert_includes @form.errors.details[:status], error: :inclusion, value: 'invalid_status'
  end

  test "validates date_to is after date_from" do
    @form.date_from = Date.today
    @form.date_to = Date.yesterday
    @form.valid?
    assert_includes @form.errors.details[:date_to], error: "must be after date from"
  end
end