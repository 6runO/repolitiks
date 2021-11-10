class User < ApplicationRecord
  has_many :marcados, dependent: :destroy
  has_many :candidatos, through: :marcados
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true
  validates :email, uniqueness: true
  # validates email com regex?
end
