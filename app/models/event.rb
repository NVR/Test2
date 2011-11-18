class Event < ActiveRecord::Base
  has_event_calendar

  attr_accessible :name, :start_at, :end_at, :repeat, :repeat_frequency, :repeat_after

  belongs_to :user
end
