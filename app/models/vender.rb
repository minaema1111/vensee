class Vender < ApplicationRecord
  has_one_attached :image
  has_many :prefectures

  # validates :user, presence: true, foreign_key: true
  # with_options presence: true do
  # validates :title
  # validates :genre_id
  # validates :residence
  # validates :introduction
  # end
end
