require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  property current_user : User? = context.current_user
  include JasperHelpers
  LAYOUT = "application.slang"

  def signed_in?
    current_user ? true : false
  end

  private def redirect_signed_out_user
    unless signed_in?
      flash[:info] = "Must be logged in"
      redirect_to "/signin"
    end
  end

end
