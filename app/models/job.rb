class Job < ApplicationRecord
  validates :title, presence: true
  enum category: %i[full_time part_time freelance remote]
  validates :company, :link, :description, presence: true
end
