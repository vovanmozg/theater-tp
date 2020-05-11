# Only one spectacle per date
class Event < ApplicationRecord
  validates :title, presence: true, length: { minimim: 1, maximum: 200 }
  validates :date_start, presence: true
  validates :date_end, presence: true
  validate :intersect_date_range
  validate :date_range

  def intersect_date_range
    busy_dates = Events::Services::IntersectingDates.new(date_start, date_end, self).call
    return if busy_dates.empty?

    # TODO: customize date format
    errors.add(:base, "Необходимо выбрать свободные даты. Занятые дни: #{busy_dates}")
  end

  def date_range
    return unless date_start > date_end

    # TODO: move errors to translate
    errors.add(:date_end, 'Дата окончания спектакля в афише не может быть меньше даты начала')
  end
end

# TODO: add description, time, poster
