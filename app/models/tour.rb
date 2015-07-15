class Tour < ActiveRecord::Base
  belongs_to :host, class_name: :User
end
