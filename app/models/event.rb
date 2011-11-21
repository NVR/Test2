class Event < ActiveRecord::Base
  has_event_calendar

  attr_accessible :name, :start_at, :end_at, :repeat, :repeat_frequency, :repeat_after

  belongs_to :user

  scope :user_events,->(user_id){
    userid_formatted = "%" + user_id + "%"
    where('user_id LIKE ?', userid_formatted)
  }
  
end
