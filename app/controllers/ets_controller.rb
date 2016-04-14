class EtsController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_ets?

  def index
    if params[:room] and params[:building]
      @courses = Course.search(params[:room] + " " + params[:building],params[:time])
    elsif params[:room] 
      @courses = Course.search(params[:room],params[:time])
    elsif params[:building]
      @courses = Course.search(params[:building],params[:time])
    else
      @courses = Course.all
    end
  end
end
