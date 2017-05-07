class Location < ApplicationRecord
  has_one :user_home, class_name: 'Cleaner', foreign_key: 'home_location'
  has_one :user_work, class_name: 'Cleaner', foreign_key: 'work_location'
end
