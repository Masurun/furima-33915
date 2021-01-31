class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :birth, presence: true

        with_options presence: true, format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/} do
         validates :first_name, presence: true
         validates :last_name, presence: true
        end

        with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
        end

        validates :password ,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} 
        validates :password,length:{minimum:6}
        
       
end