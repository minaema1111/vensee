class Vender < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  geocoded_by :residence
  after_validation :geocode, if: :residence_changed?

  belongs_to :genre
  belongs_to :user, optional: true
  has_many :comments
  has_one_attached :image

  validates :title, :residence, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "--は選択できません！"}

end
