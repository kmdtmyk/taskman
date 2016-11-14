class Project < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end

end
