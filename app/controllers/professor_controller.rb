class ProfessorController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_professor?

  def index
    @professor = Professor.all_data_for(params[:id])
    if @professor.name.nil? or @professor.email.nil? or @professor.department.nil?
      flash[:message] = 'Your profile is incomplete. Please update your profile.'
    end
  end

  def update
    if params[:professor].nil?
      course = clean_data(parse_params_course)
      updated_course = Course.update(params[:course_id], course)
      updated_course.request.update_attributes!(parse_params_request)
    else
      professor_params = parse_params_profile
      prof_info = professor_params.slice(:name, :email, :department)
      prof_info[:request_copy] = professor_params[:subscription].include?('request_copy')
      prof_info[:notification] = professor_params[:subscription].include?('notification')
      Professor.update(params[:id], prof_info)
    end
    redirect_to professor_path(params[:id])
  end

  def create
    new_course = clean_data(parse_params_course)
    new_course[:request] = Request.create!(parse_params_request)
    Professor.find(params[:id]).courses.create!(new_course)
    redirect_to professor_path(params[:id])
  end

  def destroy
    Professor.find(params[:id]).courses.destroy(Course.find(params[:course_id]))
    Course.find(params[:course_id]).destroy
    redirect_to professor_path(params[:id])
  end

  private

  def clean_data data
    data[:days] = data[:days].join
    data[:abbreviation] = Course.fix_abbreviation(data[:abbreviation])
    data[:start_time] = Course.denormalize_time(data[:start_time])
    data[:end_time] = Course.denormalize_time(data[:end_time])
    data
  end

  def parse_params_course
    params[:course][:days] ||= []
    params.require(:course).permit(:title, :ccn, :abbreviation, :location, :start_time, :end_time, days: [])
  end

  def parse_params_request
    params[:request][:comments] ||= 'No Comment.'
    params[:request][:format] ||= 'Basic Lecture'
    params[:request][:status] = 0
    params.require(:request).permit(:comments, :format, :status)
  end

  def parse_params_profile
    params[:professor][:subscription] = [params[:professor][:subscription]].flatten
    params.require(:professor).permit(:name, :email, :department, subscription: [])
  end

end
