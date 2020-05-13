# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

return if Event.count > 0
Event.create(
  [
    { title: 'Золотой ключик или приключения Буратино', date_start: Date.today + 1, date_end: Date.today + 2 },
    { title: 'Синдром счастья, или Ложь по контракту', date_start: Date.today + 3, date_end: Date.today + 3 },
    { title: 'Кафка', date_start: Date.today + 4, date_end: Date.today + 5 }
  ]
)

