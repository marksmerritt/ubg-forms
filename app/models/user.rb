class User < ApplicationRecord
  enum role: { employee: 0, supervisor: 1, admin: 2 }
  
  has_many :forms
  has_many :notifications, foreign_key: :recipient_id
  has_many :registrations
  has_many :courses, through: :registrations
  has_many :exams, through: :courses

  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  
  validates_presence_of :first_name, :last_name, :role   

  def display_name
    "#{first_name} #{last_name.first}."
  end      
end
