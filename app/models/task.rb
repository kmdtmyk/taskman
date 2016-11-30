class Task < ApplicationRecord
  has_many :comments
  belongs_to :project

  validates :title, presence: true
end
