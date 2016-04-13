class Course < ActiveRecord::Base

  has_and_belongs_to_many :professors, join_table: :assignments
  has_one :request


end
