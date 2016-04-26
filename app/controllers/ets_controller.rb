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
    # if rejeted
    elsif action == "cancel"
      req.delete
    end
    redirect_to ets_path
  end
end
