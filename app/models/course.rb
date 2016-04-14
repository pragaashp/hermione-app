class Course < ActiveRecord::Base

  has_and_belongs_to_many :professors, join_table: :assignments
  has_one :request

  def self.search(location,time,sort)
    puts sort
    Course.where("location LIKE ?", "%#{location}%").where("time LIKE ?", "%#{time}%").order(sort)
  end
  
end
