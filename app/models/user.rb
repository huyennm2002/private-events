class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, class_name: "Event"
  has_many :event_attendees, foreign_key: "attendee_id"
  has_many :attended_events, :through => :event_attendees, :source => :attended_event
  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true
end
