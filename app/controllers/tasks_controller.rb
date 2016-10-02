class TasksController < ActionController::API

  def index
    render json: create_ordered_all
  end

  def create
    task = Task.new(task_param)
    task.save!
    render json: create_ordered_all
  end

  private

  def task_param
    params.require(:task).permit(:name, :description, :user_id)
  end

  def create_ordered_all
    Task.all.order(created_at: :desc)
  end
end
