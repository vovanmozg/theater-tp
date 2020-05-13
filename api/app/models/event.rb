# Only one spectacle per date
class Event < ApplicationRecord
  validates :title, presence: true, length: { minimim: 1, maximum: 200 }
  validates :date_start, presence: true
  validates :date_end, presence: true
  validate :intersect_date_range
  validate :end_after_start

  private

  def intersect_date_range
    return if date_start.blank? || date_end.blank?

    busy_dates = Events::Services::IntersectingDates.new(date_start, date_end, self).call
    return if busy_dates.empty?

    # TODO: customize date format
    errors.add(:base, "Необходимо выбрать свободные даты. Занятые дни: #{busy_dates}")
  end

  def end_after_start
    return if date_start.blank? || date_end.blank?

    return unless date_start > date_end

    # TODO: move errors to translate
    errors.add(:date_end, 'Дата окончания спектакля в афише не может быть меньше даты начала')
  end
end

# TODO: add description, time, poster
