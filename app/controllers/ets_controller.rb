class EtsController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_ets?

  def index
    params[:search] ||= session[:search]
    params[:sort] ||= session[:sort]
    @requests = Request.filter(params[:search], params[:sort])
    session[:search], session[:sort] = params[:search], params[:sort]
  end

  def update
    request = Request.update(params[:id], status: params[:status].to_i)
    # if params[:status].to_i > 0
    #   send_accept_message(request.course.professors.first, request.course)
    # else
    #   send_reject_message(request.course.professors.first, request.course)
    # end
    redirect_to ets_path
  end

  def send_accept_message(professor, course)
    RestClient.post "https://api:key-6f2ddc1440a8cb30defa080219767e6e@api.mailgun.net/v3/sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org/messages",
                    :from => "ETS Admin <postmaster@sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org>",
                    :to => professor.email,
                    :subject => "Your Webcast Request has Been Accepted",
                    :text => "Hello " + professor.name + ",\nYour webcast request for " + course.title + " has been accepted."
  end

  def send_reject_message(professor, course)
    RestClient.post "https://api:key-6f2ddc1440a8cb30defa080219767e6e@api.mailgun.net/v3/sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org",
                    :from => "ETS Admin <postmaster@sandboxd878e942441a4dfe8de8574efe8459b0.mailgun.org>",
                    :to => professor.email,
                    :subject => "Your Webcast Request has Been Denied",
                    :text => "Hello " + professor.name + ",\nUnfortunately, your webcast request for " + course.title + "has been denied."
  end

end
