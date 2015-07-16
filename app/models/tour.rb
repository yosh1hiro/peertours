class Tour < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :tour_rules, inverse_of: :tour, dependent: :destroy
  has_many :tour_flows, inverse_of: :tour, dependent: :destroy
  accepts_nested_attributes_for :tour_flows
  has_many :tour_categories, inverse_of: :tour, dependent: :destroy
  has_many :tour_prices, inverse_of: :tour, dependent: :destroy
  has_many :tour_photos, inverse_of: :tour, dependent: :destroy

  validates :name, length: { in: 10..100 }
  validates :outline, length: { in: 100.. 1000 }
  validates :description, length: { in: 100..5000 }
  validates :minimum_number, presence: true
  validates :maximum_number, presence: true
  validates :rendezvous, presence: true
end
