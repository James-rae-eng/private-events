class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    #has_many :users
    has_many :rsvps, foreign_key: :attended_event_id
    has_many :attendees, through: :rsvps

    validates :title, presence: true
    validates :date, presence: true
    validates :location, presence: true

    scope :past, -> { where('date < ?', DateTime.now) }
    scope :future, -> { where('date > ?', DateTime.now) }
end
