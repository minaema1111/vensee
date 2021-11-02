class Vender < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  geocoded_by :residence
  after_validation :geocode, if: :residence_changed?


  belongs_to :genre
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, :residence, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "--は選択できません！"}
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Vender.where('residence LIKE(?)', "%#{search}%")
    else
      Vender.all
    end
  end
end
