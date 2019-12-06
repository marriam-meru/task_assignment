class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  belongs_to :institution, optional: true
  validates :institution, presence: true, on: :new_custom_user

  # validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :phone_number, format: { with: /\A[0-9]+\z/, message: "only allows digits" }
  
  protected
  def password_required?
    confirmed? ? super : false
  end

end
