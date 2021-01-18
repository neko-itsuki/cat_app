class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :furigana_name, presence: true,
                   length: { maximum: 50 }
  validates :email, length: { maximum:255 }
  validates :age, numericality: { greater_than_or_equal_to: 18,
                                  less_than: 65 }
  validates :gender, presence: true
  VALID_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }
  validates_acceptance_of :pets_allowed, allow_nil: false, on: :create
  validates_acceptance_of :living, allow_nil: false, on: :create
  validates_acceptance_of :vaccination, allow_nil: false, on: :create
  
end

 # :confirmable, :lockable, :timeoutable,
        # :trackable
