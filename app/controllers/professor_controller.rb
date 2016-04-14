class ProfessorController < ApplicationController # TEMPORARY: AFTER CAS -> CHANGE TO LoginController #

  # After CAS Implemented, Uncomment Below.
  # before_action :is_professor?

  def index
    @professor = Professor.find_by name: 'Armando Fox'
    @requests = @professor.requests
  end

  def new

  end

  def edit
    
  end

  def create

  end

end
