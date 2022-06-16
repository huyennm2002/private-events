class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :event_attendees, foreign_key: 'attended_event_id', dependent: :destroy
    has_many :attendees, :through => :event_attendees, :source => :attendee
    # has_many :attendee, :through => :event_attendees
    validates :name, :location, :date, presence: true
end
