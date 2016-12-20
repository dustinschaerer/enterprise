class Debugger < ApplicationRecord
  belongs_to :ruby_version
  belongs_to :puppet_version

  has_many :user_debugger_assignments, dependent: :delete_all
  has_many :users, through: :user_debugger_assignments

  has_many :puppet_module_debugger_assignments, dependent: :delete_all
  has_many :puppet_modules, through: :puppet_module_debugger_assignments

  accepts_nested_attributes_for :puppet_module_debugger_assignments
  accepts_nested_attributes_for :user_debugger_assignments
  accepts_nested_attributes_for :puppet_modules
  accepts_nested_attributes_for :users

  validates_presence_of :name, :ruby_version, :puppet_version
  validates_uniqueness_of :name

end
