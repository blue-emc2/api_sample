class TasksController < ActionController::API

  def index
    @tasks ||= Task.all
    render json: @tasks
  end
end
