class Tour < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :tour_rules, inverse_of: :tour, dependent: :destroy
  has_many :tour_flows, inverse_of: :tour, dependent: :destroy
  accepts_nested_attributes_for :tour_flows
  has_many :tour_categories, inverse_of: :tour, dependent: :destroy
  has_many :tour_prices, inverse_of: :tour, dependent: :destroy
  has_many :tour_photos, inverse_of: :tour, dependent: :destroy
end
