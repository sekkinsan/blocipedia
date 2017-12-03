class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  enum role: [:standard, :admin, :premium]
  

  after_initialize { self.role ||= :standard }


end
