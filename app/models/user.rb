class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :encrypted_password, :password, :password_confirmation, length: { minimum: 6 },format: { with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{7,}/ }
  # validates :nickname, presence: true
  # validates :first_name,format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ },presence: true
  # validates :last_name,format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ },presence: true
  # validates :first_name_kana,format: { with: /\A([ァ-ン]|ー)+\z/ },presence: true
  # validates :last_name_kana,format: { with: /\A([ァ-ン]|ー)+\z/ },presence: true
  # validates :birth_day, presence: true
end
