class Prefecture < ApplicationRecord
  has_many :cities
  # belongs_to :vender, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
