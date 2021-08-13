class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # raise
    @task = Task.find(params[:id])
  end

  def new
    # This creates an empty instance of Task
    @task = Task.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
