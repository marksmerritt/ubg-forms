class User < ApplicationRecord
  enum role: { employee: 0, supervisor: 1, admin: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  
  validates_presence_of :first_name, :last_name, :role         
end
