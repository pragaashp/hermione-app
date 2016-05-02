# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# - - - - - - - - - - - #
Professor.delete_all
Course.delete_all
Request.delete_all
# - - - - - - - - - - - #

armando_fox = Professor.create!(name: 'Armando Fox', email: 'fox@cs.berkeley.edu', department: 'Computer Science', request_copy: false, notification: false)
anthony_joseph = Professor.create!(name: 'Anthony Joseph', email: 'adj@cs.berkeley.edu', department: 'Computer Science', request_copy: true, notification: false)
jonathan_shewchuk = Professor.create!(name: 'Jonathan Shewchuk', email: 'jrs@cs.berkeley.edu', department: 'Computer Science', request_copy: true, notification: true)

request_ls = Request.create!(comments: 'No Comment.', status: 0, format: 'Lecture with Slides')
request_mc = Request.create!(comments: 'No Comment.', status: 1, format: 'Multiple Chalkboard')
request_bl = Request.create!(comments: 'No Comment.', status: -1, format: 'Basic Lecture')

armando_fox.courses.create(title: 'Software Engineering', ccn: 26619, abbreviation: 'CS 169', location: '10 EVANS', days: 'TuTh', start_time: '1530', end_time: '1700', request: request_ls)
anthony_joseph.courses.create(title: 'Operating Systems', ccn: 26520, abbreviation: 'CS 162', location: '245 LI KA SHING', days: 'MW', start_time: '1700', end_time: '1830', request: request_bl)
jonathan_shewchuk.courses.create(title: 'Machine Learning', ccn: 26826, abbreviation: 'CS 189', location: '2050 VLSB', days: 'MW', start_time: '1830', end_time: '2000', request: request_mc)