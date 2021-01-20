class Center < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cats, dependent: :destroy
  
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :furigana_name, presence: true,
                   length: { maximum: 50 }
  validates :email, length: { maximum:255 }
  validates :director_name, presence: true,
                   length: { maximum: 25 }
  validates :staff_name, presence: true,
                   length: { maximum: 25 }
  VALID_CENTER_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
  validates :tel, presence: true, format: { with: VALID_CENTER_TEL_REGEX }
  validates_acceptance_of :approval, allow_nil: false, on: :create
  validates_acceptance_of :release, allow_nil: false, on: :create
  validates_acceptance_of :listok, allow_nil: false, on: :create
  
end
