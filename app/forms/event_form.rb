class EventForm
  include ActiveModel::Model

  attr_accessor :id, :title, :description, :status, :date_from, :date_to

  validates :title, presence: true
  validates :status, inclusion: { in: %w[draft upcoming in_progress finished canceled] }
  validates :date_from, presence: true
  validates :date_to, presence: true
  validate :date_to_is_after_date_from

  def initialize(params = {})
    super params
  end

  def attributes
    {
      id: id,
      title: title,
      description: description,
      status: status,
      date_from: date_from,
      date_to: date_to
    }
  end

  private

  def date_to_is_after_date_from
    return if date_to.blank? || date_from.blank? || date_to > date_from

    errors.add(:date_to, "must be after date from")
  end
end