class Prefecture < ApplicationRecord
  belongs_to :vender
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
