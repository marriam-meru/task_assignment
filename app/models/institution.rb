class Institution < ApplicationRecord
  has_one_attached :logo
  has_many :users, dependent: :destroy
  validates :name, presence: true,  format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :logo, presence: true
end
