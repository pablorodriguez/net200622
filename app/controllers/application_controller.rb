# frozen_string_literal: true

# global application controller
class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_p3p_header

  def set_p3p_header
    response.set_header(
      'P3P', 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
    )
  end
end
