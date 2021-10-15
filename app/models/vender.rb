class Vender < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :genre
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, :residence, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "--は選択できません！"}
end
