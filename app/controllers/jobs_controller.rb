class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user
      @incomplete_jobs = current_user.jobs.where(complete: false)
      @complete_jobs = current_user.jobs.where(complete: true)
    end
#    @jobs = Job.all
#    respond_with(@jobs)
  end

=begin
  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end
=end

  def create
    @job = current_user.jobs.create!(job_params)
    redirect_to jobs_url
=begin
    @job = Job.new(job_params)
    @job.save
    respond_with(@job)
=end
  end

  def update
    @job = current_user.jobs.find(params[:id])
    @job.update!(job_params)
    respond_to do |format|
      format.html { redicret_to jobs_url }
      format.js
    end
=begin
    @job.update(job_params)
    respond_with(@job)
=end

  end

  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redicret_to jobs_url }
      format.js
    end
=begin
    @job.destroy
    respond_with(@job)
=end

  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:user_id, :name, :message, :complete)
    end
end
