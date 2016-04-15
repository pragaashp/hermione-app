class ProfessorController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_professor?

  def index
    @professor = Professor.find_by name: 'Armando Fox'
    if @professor == nil
      # TODO get rid of this once CAS works
      @professor = Professor.create({:name=> "Armando Fox", :department=>"Computer Science"})
      request1 = Request.create({:comments=>"Audio & Projector", :status=>"Approved"})
      Course.create({:ccn =>26619,:title => "CS 169",:location =>"10 EVANS", :days=>"TuTh", :time=>"1530-1700", :request=>request1,
      :professors=>Professor.where(:name =>'Armando Fox')})
      @requests = @professor.requests
    else
      @requests = @professor.requests
    end
  end

  def new

  end

  def edit
    request_id = params[:id]
    currRequest = Request.find(request_id)
    ccn = params[:ccn]
    course_name = params[:course_name]
    location = params[:location]
    days = params[:days]
    time = params[:time]
    request_and_layout = params[:request_and_layout]
    currRequest.course.title = course_name
    currRequest.course.ccn = ccn
    currRequest.course.location = location
    currRequest.course.days = days
    currRequest.course.time = time
    currRequest.comments = request_and_layout
    currRequest.save
    currRequest.course.save
    redirect_to professor_path
  end

  def create
    prof_id = params[:id]
    curr_prof = Professor.first
    ccn = params[:ccn]
    course_name = params[:course_name]
    location = params[:location]
    days = params[:days]
    # time = params[:time]
    time = "1-2PM" #can't crurently see the time field on the form
    request_and_layout = params[:request_and_layout]
    
    if Course.where(:ccn => ccn).blank?
      new_req = Request.new({:comments => request_and_layout, :status => "Pending"})
      new_course = Course.new({:ccn =>ccn,:title => course_name,:location =>location, :days=>days, :time=>time, :request=>new_req,
      :professors=>Professor.where(:name => 'Armando Fox')})
      new_req.save
      new_course.save
    else
      # do something here?
    end
    redirect_to professor_path
  end

end
