class RubyVersion < ApplicationRecord
  has_many :debuggers
  validates_presence_of :version
  validates_uniqueness_of :version
end
