class EtsController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_ets?
  
  def index
    sort = params[:sort]
    if params[:search].nil? then location ="" else location = params[:search][:room] +" "+ params[:search][:building].upcase end
    if params[:time].nil? then time = "" else time = params[:time] end
    puts location
    @courses = Course.search(location,time,sort)
    @requests = Request.all
  end
  
  def email
    action = params[:stuff]
    req = params[:request]
    req = Request.find(req)
    
    # if accepted
    if action == "accept"
      req.status = "1"
      req.save
      req.course.professors.each {|professor|
        send_accept_message(professor,req.course)
      }
    # if rejected
    elsif action == "cancel"
      req.course.professors.each {|professor|
        send_reject_message(professor,req.course)
      }
      req.delete
      
    end
    redirect_to ets_path
  end
  
  def edit
    req = params[:request]
    req = Request.find(req)
    req.status = "0"
    req.save
    redirect_to ets_path
  end
  
  def send_accept_message(professor, course)
    RestClient.post "https://api:key-6f2ddc1440a8cb30defa080219767e6e"\
    "@api.mailgun.net/v3/sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org/messages",
    :from => "ETS Admin <postmaster@sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org>",
    :to => professor.email,
    :subject => "Your Webcast Request has Been Accepted",
    :text => "Hello " + professor.name + ",\nYour webcast request for " + course.title + " has been accepted."
  end
  
  def send_reject_message(professor,course)
    RestClient.post "https://api:key-6f2ddc1440a8cb30defa080219767e6e"\
    "@api.mailgun.net/v3/sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org",
    :from => "ETS Admin <postmaster@sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org>",
    :to => professor.email,
    :subject => "Your Webcast Request has Been Denied",
    :text => "Hello " + professor.name + ",\nUnfortunately, your webcast request for " + course.title + "has been denied."
  end

end
