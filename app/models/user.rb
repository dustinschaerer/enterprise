class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one :profile
   before_create :build_profile

   has_many :user_debugger_assignments, dependent: :delete_all
   has_many :debuggers, through: :user_debugger_assignments
end
