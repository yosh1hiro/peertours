class Tour < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :tour_rules, dependent: :destroy
  has_many :tour_flows, dependent: :destroy
  has_many :tour_categories, dependent: :destroy
  has_many :tour_prices, dependent: :destroy
  has_many :tour_photos, dependent: :destroy
end
