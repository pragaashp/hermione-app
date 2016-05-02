require 'time'

class Course < ActiveRecord::Base

  has_and_belongs_to_many :professors, join_table: :assignments
  has_one :request, dependent: :destroy

  def days_list
    days.split(/([A-z][a-z]*)/).select { |d| !d.empty? }
  end

  def self.fix_abbreviation abbreviation
    abbreviation.split(/^([A-Z]+)\s*([0-9]+[A-Z]*)$/).select { |x| !x.empty? }.join(' ')
  end

  def self.normalize_time time
    time.slice(0,2) + ':' + time.slice(2,4) + ':00'
  end

  def self.denormalize_time time
    time.split(':').slice(0,2).join
  end

  def self.resolve_time time
    Time.strptime(time,"%H%M").strftime("%I:%M%p").sub(/^0/,'')
  end

end
