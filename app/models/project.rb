class Project < ActiveRecord::Base
  validates :description, presence: true
end
