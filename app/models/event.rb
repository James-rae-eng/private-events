class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :users

    validates :title, presence: true
    validates :date, presence: true
    validates :location, presence: true
end
