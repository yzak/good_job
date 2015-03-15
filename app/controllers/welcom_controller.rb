class WelcomController < ApplicationController
  def index
    redirect_to jobs_url if current_user
  end
end
