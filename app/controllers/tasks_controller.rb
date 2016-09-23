class TasksController < ActionController::API

  def index
    @tasks ||= Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(task_param)
    @task.save!
    render json: @task.id
  end

  private

  def task_param
    params.require(:task).permit(:name, :description, :user_id)
  end
end
