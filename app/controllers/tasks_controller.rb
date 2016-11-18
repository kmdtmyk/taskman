class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  before_action :set_project, only: [:new, :create]

  def new
    @task = @project.tasks.build
  end

  def show
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: 'Taks was successfully created.'
    else
      render :new
    end
  end

  private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :body)
    end

end
