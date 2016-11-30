class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  before_action :set_project, only: [:index, :new, :create]

  def index
    @q = params[:q]
    @tasks = Task
      .where('project_id = ?', @project)
      .where('title LIKE ?', "%#{@q}%")
      .order(updated_at: :DESC)
      .page(params[:page])
  end

  def new
    @task = @project.tasks.build
  end

  def show
    @comment = @task.comments.build
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to [@project, @task], notice: 'Task was successfully created.'
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
