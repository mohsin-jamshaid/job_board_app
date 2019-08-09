class JobsController < ApplicationController
  before_action :find_job, except: %i[index new create]

  def index
    @jobs = Job.order('created_at desc')
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:success] = 'Job has been successfully created'
      redirect_to job_path(@job)
    else
      flash[:error] = 'Unable to create job'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @job.update(job_params)
      flash[:success] = 'Job has been successfully created'
      redirect_to job_path(@job)
    else
      flash[:error] = 'There must have been an error while updating the job'
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    flash[:success] = 'Job has been successfully created'
    redirect_to jobs_path
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :category, :company, :description, :link)
  end
end
