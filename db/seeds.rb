# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

request1 = Request.create({:comments=>"Audio & Projector", :status=>"Approved"})
request2 = Request.create({:comments=>"Audio & Video", :status=>"Pending"})
request3 = Request.create({:comments=>"Audio, Video & Projector", :status=>"Denied"})
professor1 = Professor.create({:name=> "Armando Fox", :department=>"Computer Science"})
professor2 = Professor.create({:name=> "Joseph, A D", :department=>"Computer Science"})
professor3 = Professor.create({:name=> "Shewchuk, J", :department=>"Computer Science"})

Course.create({:ccn =>26619,:title => "CS 169",:location =>"10 EVANS", :days=>"TuTh", :time=>"1530-1700", :request=>request1,
:professors=>Professor.where(:name =>'Armando Fox')})

Course.create({:ccn =>26619,:title => "CS 162",:location =>"245 LI KA SHING", :days=>"MW", :time=>"1700-1830", :request=>request2,
:professors=>Professor.where(:name =>'Joseph, A D')})

Course.create({:ccn =>26619,:title => "CS 189",:location =>"2050 VLSB", :days=>"MW", :time=>"1830-2000", :request=>request3,
:professors=>Professor.where(:name =>'Shewchuk, J')})
