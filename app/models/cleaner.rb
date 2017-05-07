class Cleaner < ApplicationRecord
  belongs_to :home_location, class_name: 'Location'
  belongs_to :work_location, class_name: 'Location'
end
