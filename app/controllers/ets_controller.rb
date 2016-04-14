class EtsController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_ets?

  def index
    sort = params[:sort]
    if params[:search].nil? then location ="" else location = params[:search][:room] + params[:search][:building].upcase end
    if params[:time].nil? then time = "" else time = params[:time] end
    @courses = Course.search(location,time,sort)

  end
end
