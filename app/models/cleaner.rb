class Cleaner < ApplicationRecord
  belongs_to :home_location, class_name: 'Location'
  belongs_to :work_location, class_name: 'Location'

  validates :name, presence: true
  validates :phone, presence: true

  def to_s
    name
  end
end
