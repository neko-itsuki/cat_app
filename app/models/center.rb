class Center < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cats, dependent: :destroy
  has_many :dogs, dependent: :destroy
  
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :furigana_name, presence: true,
                   length: { maximum: 50 }
  validates :email, length: { maximum:255 }
  validates :director_name, presence: true,
                   length: { maximum: 25 }
  validates :staff_name, presence: true,
                   length: { maximum: 25 }
  
  validates :postcode, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  
  VALID_CENTER_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
  validates :tel, presence: true, format: { with: VALID_CENTER_TEL_REGEX }
  validates_acceptance_of :approval, allow_nil: false, on: :create
  validates_acceptance_of :release, allow_nil: false, on: :create
  validates_acceptance_of :listok, allow_nil: false, on: :create
  
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
