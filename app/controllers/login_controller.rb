class LoginController < ApplicationController

  before_filter RubyCAS::Filter

  def identify
    # Check if user is a faculty member i.e. professor or ETS.
    # - - - - -
    # if is_professor?(session[...])
    #   redirect_to professor_path
    # else
    #   redirect_to ets_path
    # end
    # - - - - -
  end

  private

  def is_professor?
    # Make API call via Professor's Model to establish professor status.
  end

  def is_ets?
    !is_professor?
  end
end