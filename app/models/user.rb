class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_rooms, dependent: :destroy
  has_many :user_messages, dependent: :destroy
  has_many :user_active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :user_passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :furigana_name, presence: true,
                   length: { maximum: 50 }
  validates :email, length: { maximum:255 }
  validates :age, numericality: { greater_than_or_equal_to: 18,
                                  less_than: 65 }
  validates :gender, presence: true
  
  validates :postcode, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  
  VALID_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }
  
  validates_acceptance_of :pets_allowed, allow_nil: false, on: :create
  validates_acceptance_of :living, allow_nil: false, on: :create
  validates_acceptance_of :vaccination, allow_nil: false, on: :create
  
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
  
  def self.guest
    find_by!(email: 'guest-user@example.com')
  end
  
end
