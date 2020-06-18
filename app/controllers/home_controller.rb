# frozen_string_literal: true

# sample feature
class HomeController < ApplicationController
  before_action :authorize_home

  def index
    @home = ExampleService.new.execute
  end

  def admin
    head :ok
  end

  private

  def authorize_home
    authorize :home
  end
end
