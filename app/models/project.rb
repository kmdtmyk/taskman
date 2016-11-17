class Project < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  def normalize_friendly_id(value)
    value.to_s.parameterize.present? ? value.to_s.parameterize : value
  end

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

end
