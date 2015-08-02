class TourRule < ActiveRecord::Base
  validates :tour, presence: true
  belongs_to :tour, inverse_of: :tour_rules
end
