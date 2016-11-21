class CommentsController < ApplicationController
  before_action :set_task, onlu: [:create]



  def create
    @comment = @task.comments.build(comment_params)
    if @comment.save
      redirect_to [@task.project, @task], notice: 'Comment was successfully created.'
    else
      render template: 'tasks/show'
    end
  end

  private

    def set_task
      @task = Task.find(params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
