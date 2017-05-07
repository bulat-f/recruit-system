class Assignment < ApplicationRecord
  validates :zip_code, presence: true
  validates :radius, presence: true
  validates :message, presence: true
end
